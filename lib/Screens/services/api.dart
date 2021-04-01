/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:tester/Screens/model/student.dart';

class Api {
  //final Firestore _db = Firestore.instance;
  //final String path;
  //CollectionReference ref;
  final CollectionReference ref = Firestore.instance.collection('User');
  final String uid;
  Api({this.uid});
  //Api(this.path) {
  //ref = _db.collection(path);
  //}
  Future updateUserData(
      String name, String email, String password, String id) async {
    return await ref.document(uid).setData(
        {'email': email, 'password': password, 'name': name, 'id': id});
  }

  List<Student> _StudentList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Student(name: doc.data['name'] ?? '', email: doc.data[''] ?? '');
    }).toList();
  }

  Stream<List<Student>> streamDataCollection() {
    return ref.snapshots().map(_StudentList);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }
}
*/