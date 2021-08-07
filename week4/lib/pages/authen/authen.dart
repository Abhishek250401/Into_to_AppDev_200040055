import 'package:flutter/material.dart';
import 'package:week4/pages/authen/register.dart';
import 'package:week4/pages/authen/sign_in.dart';

class authenticate extends StatefulWidget {
  const authenticate({Key? key}) : super(key: key);

  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool state = true;
  void toggle() {
    setState(()=> state = !state);
}


  @override
  Widget build(BuildContext context) {
    if (state){
      return signin(toggle: toggle);

    }else {
      return register(toggle: toggle);
    }

  }
}
