import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  FirebaseStorage storage;

  StorageRepository() {
    this.storage = FirebaseStorage.instance;
  }

  Reference setReference(String path) {
    return storage.ref(path);
  }

  Future<ListResult> getAllFilesInFolder(String path) {
    Reference ref = setReference(path);
    return ref.listAll();
  }

  Future<String> getDownloadUrl(String file) {
    Reference ref = setReference(file);
    return ref.getDownloadURL();
  }

  Future<void> uploadFile(String path, String filePath) async {
    Reference ref = setReference(path);
    File file = File(filePath);
    dynamic uploadFile;
    try {
      uploadFile = await ref.putFile(file);
      print(uploadFile);
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
