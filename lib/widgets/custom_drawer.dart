import 'package:flutter/material.dart';
import 'package:my_market/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    
    //menu decorado
    Widget _builDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 170, 248, 248),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
    
    return Drawer(
      child: Stack(
        children: <Widget>[
          _builDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("My Market",
                        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),),
                    ),

                    Positioned(
                      left: 0.0,
                      bottom: 16.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá,",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            child: Text("Entre ou cadastre-se >",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: () {

                            },
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Mercados", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Minhas Compras", pageController, 3),
            ],
          )
        ],
      )
    );
  }
}