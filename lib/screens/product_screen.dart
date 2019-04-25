import 'package:flutter/material.dart';
import 'package:my_market/datas/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';


class ProductScreen extends StatefulWidget {

  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;
  _ProductScreenState(this.product);

  String weight;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 70, 193, 190),
      ),

      body: ListView(
        children: <Widget>[
          
          // imagens
          AspectRatio(
            aspectRatio: 1.0,
            child: Carousel(
              images: product.images.map((url) {
                  return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: Theme.of(context).primaryColor,
              autoplay: false,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                // nome produto
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),

                // valor
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor
                  ),
                ),

                SizedBox(
                  height: 16.0,
                ),

                // opções de tamanho/peso
                Text(
                  "Peso",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // apenas uma linha
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.4,
                    ),
                    children: product.weight.map((s){
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            weight = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                              color: s == weight ? Theme.of(context).primaryColor : Colors.grey[500],
                              width: 3.0
                            )
                          ),
                          width: 60.0,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16.0,),

                //botão
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed: weight != null ? 
                    () {} : null,
                    child: Text("Adicionar a cesta de compras",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0,),

                // descrição
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),

                Text(
                  product.detail,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}

