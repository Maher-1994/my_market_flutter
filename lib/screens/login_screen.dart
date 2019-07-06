import 'package:flutter/material.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

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
                  controller: _emailController,
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
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  obscureText: true,
                  validator: (text) {
                    if(text.isEmpty || text.length < 6) return "Senha inválida";
                  },
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text("Esqueci minha senha"),
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      if(_emailController.text.isEmpty)
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Informe o seu e-mail para recuperar a senha!"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          )
                        );
                      else {
                        model.recoverPass(_emailController.text);
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("E-Mail para recuperação enviado com sucesso!"),
                            backgroundColor: Theme.of(context).primaryColor,
                            duration: Duration(seconds: 2),
                          )
                        );
                      }
                    },
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
                        model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
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


  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao efetuar login!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );
  }

}