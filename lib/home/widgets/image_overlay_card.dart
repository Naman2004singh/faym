import 'package:flutter/material.dart';
import '../../utils/constants/app_constants.dart';

class ImageOverlayCard extends StatelessWidget {
  final int remainingCount;
  final VoidCallback onTap;

  const ImageOverlayCard({
    super.key,
    required this.remainingCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppConstants.imageSize,
        height: AppConstants.imageSize,
        margin: const EdgeInsets.only(right: AppConstants.imageSpacing),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black87, Colors.black54],
          ),
          borderRadius: BorderRadius.circular(AppConstants.imageBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '+$remainingCount',
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppConstants.overlayFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
