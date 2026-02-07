import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/collection_model.dart';
import '../controllers/collection_controller.dart';
import '../views/image_gallery_view.dart';
import '../../utils/constants/app_constants.dart';
import 'network_image_widget.dart';
import 'image_overlay_card.dart';

class CollectionCard extends StatelessWidget {
  final CollectionModel collection;
  
  const CollectionCard({
    super.key,
    required this.collection,
  });

  void _openGallery(int initialIndex) {
    Get.to(
      () => ImageGalleryView(
        images: collection.productImages,
        initialIndex: initialIndex,
      ),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: AppConstants.animationDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CollectionController>();
    final visibleImages = collection.productImages
        .take(AppConstants.maxVisibleImages)
        .toList();
    final remainingCount = collection.productImages.length - AppConstants.maxVisibleImages;

    return Obx(() {
      final isExpanded = controller.isExpanded(collection.id);
      
      return Card(
        elevation: AppConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstants.cardHorizontalMargin,
          vertical: AppConstants.cardVerticalMargin,
        ),
        child: Column(
          children: [
            _buildCardHeader(controller),
            _buildExpandableContent(isExpanded, visibleImages, remainingCount),
          ],
        ),
      );
    });
  }

  Widget _buildCardHeader(CollectionController controller) {
    return InkWell(
      onTap: () => controller.toggleCollection(collection.id),
      borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.cardPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              collection.title,
              style: const TextStyle(
                fontSize: AppConstants.titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => AnimatedRotation(
              duration: const Duration(milliseconds: AppConstants.animationDuration),
              turns: controller.isExpanded(collection.id) ? 0.5 : 0,
              child: const Icon(Icons.keyboard_arrow_down),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableContent(
    bool isExpanded,
    List<String> visibleImages,
    int remainingCount,
  ) {
    return AnimatedSize(
      duration: const Duration(milliseconds: AppConstants.animationDuration),
      curve: Curves.easeInOut,
      child: isExpanded
          ? Container(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.cardPadding,
                0,
                AppConstants.cardPadding,
                AppConstants.cardPadding,
              ),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 12),
                  _buildImageList(visibleImages, remainingCount),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildImageList(List<String> visibleImages, int remainingCount) {
    return SizedBox(
      height: AppConstants.imageSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: visibleImages.length + (remainingCount > 0 ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == visibleImages.length && remainingCount > 0) {
            return ImageOverlayCard(
              remainingCount: remainingCount,
              onTap: () => _openGallery(AppConstants.maxVisibleImages),
            );
          }
          
          return Container(
            margin: const EdgeInsets.only(right: AppConstants.imageSpacing),
            child: NetworkImageWidget(
              imageUrl: visibleImages[index],
              width: AppConstants.imageSize,
              height: AppConstants.imageSize,
              borderRadius: AppConstants.imageBorderRadius,
              onTap: () => _openGallery(index),
            ),
          );
        },
      ),
    );
  }
}
