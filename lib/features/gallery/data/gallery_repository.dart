import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/gallery/domain/models/gallery_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final galleryRepositoryProvider = Provider(
  (ref) => GalleryRepository(ref.watch(firebaseFirestoreProvider)),
);
