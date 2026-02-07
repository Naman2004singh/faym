import 'package:get/get.dart';
import '../models/collection_model.dart';

class CollectionController extends GetxController {
  final RxList<CollectionModel> collections = <CollectionModel>[].obs;
  final RxnString expandedCollectionId = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadCollections();
  }

  void loadCollections() {
    collections.value = [
      CollectionModel(
        id: '1',
        title: 'Collection 1',
        productImages: [
          'https://picsum.photos/200/200?random=1',
          'https://picsum.photos/200/200?random=2',
          'https://picsum.photos/200/200?random=3',
          'https://picsum.photos/200/200?random=4',
          'https://picsum.photos/200/200?random=5',
          'https://picsum.photos/200/200?random=6',
          'https://picsum.photos/200/200?random=7',
          'https://picsum.photos/200/200?random=8',
          'https://picsum.photos/200/200?random=9',
          'https://picsum.photos/200/200?random=10',
          'https://picsum.photos/200/200?random=11',
          'https://picsum.photos/200/200?random=12',
          'https://picsum.photos/200/200?random=13',
          'https://picsum.photos/200/200?random=14',
          'https://picsum.photos/200/200?random=15',
        ],
      ),
      CollectionModel(
        id: '2',
        title: 'Collection 2',
        productImages: [
          'https://picsum.photos/200/200?random=16',
          'https://picsum.photos/200/200?random=17',
          'https://picsum.photos/200/200?random=18',
          'https://picsum.photos/200/200?random=19',
          'https://picsum.photos/200/200?random=20',
          'https://picsum.photos/200/200?random=21',
        ],
      ),
      CollectionModel(
        id: '3',
        title: 'Collection 3',
        productImages: [
          'https://picsum.photos/200/200?random=22',
          'https://picsum.photos/200/200?random=23',
          'https://picsum.photos/200/200?random=24',
          'https://picsum.photos/200/200?random=25',
          'https://picsum.photos/200/200?random=26',
          'https://picsum.photos/200/200?random=27',
          'https://picsum.photos/200/200?random=28',
          'https://picsum.photos/200/200?random=29',
        ],
      ),
      CollectionModel(
        id: '4',
        title: 'Collection 4',
        productImages: [
          'https://picsum.photos/200/200?random=30',
          'https://picsum.photos/200/200?random=31',
          'https://picsum.photos/200/200?random=32',
          'https://picsum.photos/200/200?random=33',
        ],
      ),
      CollectionModel(
        id: '5',
        title: 'Collection 5',
        productImages: [
          'https://picsum.photos/200/200?random=34',
          'https://picsum.photos/200/200?random=35',
          'https://picsum.photos/200/200?random=36',
          'https://picsum.photos/200/200?random=37',
          'https://picsum.photos/200/200?random=38',
          'https://picsum.photos/200/200?random=39',
          'https://picsum.photos/200/200?random=40',
        ],
      ),
      CollectionModel(
        id: '6',
        title: 'Collection 6',
        productImages: [
          'https://picsum.photos/200/200?random=41',
          'https://picsum.photos/200/200?random=42',
          'https://picsum.photos/200/200?random=43',
          'https://picsum.photos/200/200?random=44',
          'https://picsum.photos/200/200?random=45',
        ],
      ),
      CollectionModel(
        id: '7',
        title: 'Collection 7',
        productImages: [
          'https://picsum.photos/200/200?random=46',
          'https://picsum.photos/200/200?random=47',
          'https://picsum.photos/200/200?random=48',
          'https://picsum.photos/200/200?random=49',
          'https://picsum.photos/200/200?random=50',
          'https://picsum.photos/200/200?random=51',
          'https://picsum.photos/200/200?random=52',
          'https://picsum.photos/200/200?random=53',
          'https://picsum.photos/200/200?random=54',
        ],
      ),
      CollectionModel(
        id: '8',
        title: 'Collection 8',
        productImages: [
          'https://picsum.photos/200/200?random=55',
          'https://picsum.photos/200/200?random=56',
          'https://picsum.photos/200/200?random=57',
        ],
      ),
      CollectionModel(
        id: '9',
        title: 'Collection 9',
        productImages: [
          'https://picsum.photos/200/200?random=58',
          'https://picsum.photos/200/200?random=59',
          'https://picsum.photos/200/200?random=60',
          'https://picsum.photos/200/200?random=61',
          'https://picsum.photos/200/200?random=62',
          'https://picsum.photos/200/200?random=63',
        ],
      ),
      CollectionModel(
        id: '10',
        title: 'Collection 10',
        productImages: [
          'https://picsum.photos/200/200?random=64',
          'https://picsum.photos/200/200?random=65',
          'https://picsum.photos/200/200?random=66',
          'https://picsum.photos/200/200?random=67',
          'https://picsum.photos/200/200?random=68',
          'https://picsum.photos/200/200?random=69',
          'https://picsum.photos/200/200?random=70',
          'https://picsum.photos/200/200?random=71',
        ],
      ),
    ];
  }

  void toggleCollection(String collectionId) {
    if (expandedCollectionId.value == collectionId) {
      expandedCollectionId.value = null;
    } else {
      expandedCollectionId.value = collectionId;
    }
  }

  bool isExpanded(String collectionId) {
    return expandedCollectionId.value == collectionId;
  }
}
