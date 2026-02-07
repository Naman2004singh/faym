import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/collection_controller.dart';
import '../widgets/collection_card.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CollectionController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        elevation: 2,
      ),
      body: Obx(() {
        if (controller.collections.isEmpty) {
          return const Center(
            child: Text('No collections available'),
          );
        }

        return ListView.builder(
          itemCount: controller.collections.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) {
            final collection = controller.collections[index];
            return CollectionCard(collection: collection);
          },
        );
      }),
    );
  }
}
