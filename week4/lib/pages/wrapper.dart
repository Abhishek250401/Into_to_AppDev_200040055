import 'package:flutter/material.dart';
import 'package:week4/pages/authen/authen.dart';
import 'package:week4/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:week4/pages/authen/user.dart';


class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person?>(context);
    if (user == null){
      return authenticate();
    }else{
      return home();
    }
  }
}
