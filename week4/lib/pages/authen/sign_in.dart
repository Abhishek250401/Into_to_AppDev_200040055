import 'package:flutter/material.dart';
import 'package:week4/services/auth.dart';
import 'package:week4/pages/authen/loading.dart';

class signin extends StatefulWidget {
  final Function toggle;
  signin({required this.toggle});

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
 final AuthenService _auth = AuthenService();
 final _formkey = GlobalKey<FormState>();
 bool loading= false;
  String email=" ";
  String password = " ";
  String error =" ";
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed:(){
              widget.toggle();
            },
            icon:Icon(Icons.person),
            label: Text("Register"),
            style: TextButton.styleFrom(
              primary: Colors.grey[400],
              backgroundColor: Colors.grey[800],
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
                validator: (val)=> val!.isEmpty ? 'Enter an E-mail':null,
                  decoration:  InputDecoration(
                      fillColor: Colors.grey[100],
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
                validator: (val)=> val!.length<6 ? 'Enter Valid Password':null,
                obscureText: true,
                decoration:  InputDecoration(
                    fillColor: Colors.grey[100],
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
                  onPressed: ()async {
                if(_formkey.currentState!.validate()){
                  setState(() => loading=true);
                  dynamic result = await _auth.signinWithEmail(email, password);
                  if(result==null){
                    setState((){
                        error = "Check E-mail and password OR register first";
                        loading = false;

                    });
                  }
                  }
                  },
                  style: ElevatedButton.styleFrom(
                 primary: Colors.grey[600],),
                  child: Text(
                      "Sign In",
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
    );
  }
}
