import 'package:flutter/material.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 70, 193, 190),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Criar Conta",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>SignUpScreen())
              );
            },
          )
        ],
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "E-Mail"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if(text.isEmpty || !text.contains("@")) return "E-Mail inválido";
                  },
                ),

                SizedBox(height: 16.0,),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  obscureText: true,
                  validator: (text) {
                    if(text.isEmpty || text.length < 6) return "E-Mail inválido";
                  },
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){},
                    child: Text("Esqueci minha senha"),
                    padding: EdgeInsets.zero,
                  ),
                ),

                SizedBox(height: 16.0,),

                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text("Entrar",
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 70, 193, 190),//Theme.of(context).primaryColor,
                    onPressed: (){
                      if(_formKey.currentState.validate()){

                      }

                      model.signIn();

                    },
                    elevation: 10.0,
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}