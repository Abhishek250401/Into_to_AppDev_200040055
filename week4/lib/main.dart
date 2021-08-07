import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4/pages/authen/user.dart';
import 'package:week4/pages/wrapper.dart';
import 'package:week4/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:week4/pages/authen/user.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person?>.value(
      catchError: (_, __) => null,
      value: AuthenService().user,
      initialData:null,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}

