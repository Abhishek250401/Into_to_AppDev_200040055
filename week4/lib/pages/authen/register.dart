import 'package:flutter/material.dart';
import 'package:week4/services/auth.dart';
import 'package:week4/pages/authen/loading.dart';

class register extends StatefulWidget {


  final Function toggle;
  register({required this.toggle});
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final AuthenService _auth = AuthenService();
  final _formkey = GlobalKey<FormState>();
  bool loading= false;
  String email=" ";
  String password = " ";
  String username = " ";
  String error ="";
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        actions: [
          TextButton.icon(
              onPressed:(){
                widget.toggle();
              },
              icon:Icon(Icons.person),
              label: Text("Sign In"),
            style: TextButton.styleFrom(
          primary: Colors.grey[400],
            backgroundColor: Colors.blue[800],
          ),
          ),
        ],
      ),


      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child:Form(
            key: _formkey,
            child:Column(
              children: [
                SizedBox(height: 20),
                TextFormField(

                  validator: (val)=> val!.isEmpty ? 'Enter an Username':null,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0)
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'User Name'),
                  onChanged: (val){
                    setState(() => username = val);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (val)=> val!.isEmpty ? 'Enter an E-mail':null,
                  decoration:  InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0)
                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email-ID'),
                  onChanged: (val){
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (val)=> val!.length<6 ? 'Min 6 character req':null,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0)
                      ),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password'),
                  onChanged: (val){
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if(_formkey.currentState!.validate()){
                        setState(() => loading=true);
                        dynamic result = await _auth.registerWithEmail(email,password);
                        if(result==null){
                          setState((){
                            error = "Enter a valid E-mail";
                            loading = false;
                          });

                        }
                      }
                      },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[600],),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),
                SizedBox(height: 8.0),
                Text(error,style: TextStyle(color: Colors.red,fontSize: 15),)

              ],
            ),
          ),
        ),
      ),
    );;
  }
}
