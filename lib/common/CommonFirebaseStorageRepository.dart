import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFirebaseStorageRepositoryProvider = Provider(
  (ref) => CommonFirebaseStorageRepository(
      firebaseStorage: FirebaseStorage.instance),
);

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository({required this.firebaseStorage});

  Future<String> storageFileToFirebase(String ref, File file) async {
    UploadTask task = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await task;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
