import 'package:flutter/material.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/screens/login_screen.dart';
import 'package:my_market/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

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
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              GestureDetector(
                                child: Text(!model.isLoggedIn() ? "Entre ou cadastre-se >" : "Sair",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: () {
                                  if(!model.isLoggedIn())
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>LoginScreen())
                                    );
                                  else
                                    model.signOut();
                                },
                              )
                            ],
                          );
                        },
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