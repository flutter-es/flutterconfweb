import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/gallery/domain/models/gallery_model.dart';
import 'package:signals/signals.dart';

class GalleryRepository {
  GalleryRepository(this.database);

  final FirebaseFirestore database;

  static const _galleryCollection = 'gallery';

  Future<List<GalleryModel>> getGallery() async {
    final data = await database.collection(_galleryCollection).get();
    return [
      for (final item in data.docs)
        GalleryModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }
}

final galleryRepository = computed(
  () => GalleryRepository(firebaseFirestore.value),
);
