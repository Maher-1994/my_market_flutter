import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/datas/product_data.dart';

class CartProduct {
  String cid;
  String category;
  String pid;

  int quantity;

  String weight;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    weight = document.data["weight"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "weight": weight,
      //"product": productData.toResumedMap()
      
    };
  }


}