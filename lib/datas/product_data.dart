import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  
  String category;
  String id;
  String title;
  String descrition;
  
  double price;
  
  List images;
  List weight;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    descrition = snapshot.data["descrition"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
    weight = snapshot.data["weight"];
  }

}