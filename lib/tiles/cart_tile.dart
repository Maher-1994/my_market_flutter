import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_market/datas/cart_product.dart';
import 'package:my_market/datas/product_data.dart';

class CartTile extends StatelessWidget {

  final CartProduct cartProduct;

  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {

    
    Widget _buildContent(){
      return Row(
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              cartProduct.productData.images[0],
              fit: BoxFit.cover
            ),
          ),
          
          Expanded(
            child: Container(
              
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  // titulo do produto
                  Text(cartProduct.productData.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500, 
                      fontSize: 17.0
                    ),
                  ),

                  Text("Peso: ${cartProduct.weight}",
                    style: TextStyle(
                      fontWeight: FontWeight.w300, 
                    ),
                  ),

                  Text("R\$ ${cartProduct.productData.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold, 
                      fontSize: 16.0
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (){
                          
                        },
                      ),

                      Text(cartProduct.quantity.toString()),
                      
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: (){

                        },
                      ),

                      FlatButton(
                        child: Text("Remover"),
                        color: Colors.grey[500],
                        onPressed: (){

                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }
    print("kkkk");
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
       child: 
      //cartProduct.productData == null ? 
      //   FutureBuilder<DocumentSnapshot>(
      //     future: Firestore.instance.collection("products").document(cartProduct.category)
      //     .collection("itens")
      //     .document(cartProduct.pid)
      //     .get(),
      //     builder: (context, snapshot){
      //       if(snapshot.hasData){
      //         print("loco666");
      //         cartProduct.productData = ProductData.fromDocument(snapshot.data);
      //         //return _buildContent();
      //       } else {
      //         return Container(
      //           height: 70.0,
      //           child: CircularProgressIndicator(),
      //           alignment: Alignment.center,
      //         );
      //       }
      //     },
      //   ) 
      //   : 
          Container(
            child: Text("loco2"),
            color: Colors.yellow,
          )
          //_buildContent(),
    );
  }
}