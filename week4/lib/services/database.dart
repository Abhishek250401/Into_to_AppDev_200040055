import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  // collection reference

  final CollectionReference ToDoCollection =  FirebaseFirestore.instance.collection("TO-DO");


}