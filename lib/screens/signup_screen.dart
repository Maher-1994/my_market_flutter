import 'package:flutter/material.dart';
import 'package:my_market/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 70, 193, 190),
      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){

          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);
          
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Nome"
                  ),
                  validator: (text) {
                    if(text.isEmpty) return "Nome inválido";
                  },
                ),

                SizedBox(height: 16.0,),

                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: "Endereço"
                  ),
                  validator: (text) {
                    if(text.isEmpty) return "Endereço inválido";
                  },
                ),

                SizedBox(height: 16.0,),

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
                    if(text.isEmpty || text.length < 6) return "E-Mail inválido";
                  },
                ),


                SizedBox(height: 80.0,),


                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text("Criar Conta",
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 70, 193, 190),//Theme.of(context).primaryColor,
                    onPressed: (){
                      if(_formKey.currentState.validate()){

                        Map<String, dynamic> userdata = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text,
                        };

                        model.signUp(
                          userData: userdata,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail
                          
                        );
                      }
                    },
                    elevation: 10.0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


void _onSuccess(){

}

void _onFail(){
  
}