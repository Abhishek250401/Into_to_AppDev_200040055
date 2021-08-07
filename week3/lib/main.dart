import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes:{
      '/': (context)=> loading(),
      '/home': (context)=> Home(),
      '/location': (context)=> location(),

    },

  ));
}
