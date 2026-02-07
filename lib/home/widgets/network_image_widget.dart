import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback? onTap;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 12.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey[300]!, Colors.grey[400]!],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  size: width * 0.4,
                  color: Colors.grey[600],
                ),
                SizedBox(height: height * 0.05),
                Text(
                  'No Image',
                  style: TextStyle(
                    fontSize: width * 0.1,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: content);
    }
    return content;
  }
}
