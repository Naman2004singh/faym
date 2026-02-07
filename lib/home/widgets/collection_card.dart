import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/collection_model.dart';
import '../controllers/collection_controller.dart';
import '../views/image_gallery_view.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_colors.dart';
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
      child: Container(
        padding: const EdgeInsets.all(AppConstants.cardPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.cardBorderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primaryLight,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      collection.title,
                      style: const TextStyle(
                        fontSize: AppConstants.titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              final isExpanded = controller.isExpanded(collection.id);
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isExpanded ? AppColors.primary : Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: AppConstants.animationDuration),
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: isExpanded ? Colors.white : AppColors.textSecondary,
                    size: 20,
                  ),
                ),
              );
            }),
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
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.divider,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
