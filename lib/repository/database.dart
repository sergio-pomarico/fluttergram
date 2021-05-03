import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository {
  FirebaseFirestore database;

  DatabaseRepository() {
    this.database = FirebaseFirestore.instance;
  }

  CollectionReference getReference(String collection) {
    return database.collection(collection);
  }

  Future<DocumentReference> add(String collection, dynamic data) {
    CollectionReference ref = getReference(collection);
    return ref.add(data);
  }

  Future<DocumentSnapshot> read(String collection, String document) {
    CollectionReference ref = getReference(collection);
    return ref.doc(document).get();
  }

  Future<void> update(String collection, String document, dynamic data) {
    DocumentReference ref = getReference(collection).doc(document);
    return ref.update(data);
  }

  Future<void> delete(String collection, String document) {
    DocumentReference ref = getReference(collection).doc(document);
    return ref.delete();
  }
}
