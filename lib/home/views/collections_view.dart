import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/collection_controller.dart';
import '../widgets/collection_card.dart';
import '../../utils/constants/app_colors.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CollectionController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.collections.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.collections_outlined,
                  size: 80,
                  color: AppColors.textSecondary.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'No collections available',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.collections.length,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          itemBuilder: (context, index) {
            final collection = controller.collections[index];
            return CollectionCard(collection: collection);
          },
        );
      }),
    );
  }
}
