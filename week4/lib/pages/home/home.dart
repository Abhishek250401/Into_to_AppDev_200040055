import 'package:flutter/material.dart';
import 'package:week4/services/auth.dart';

class home extends StatelessWidget {
  final AuthenService _auth = AuthenService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME",),
          centerTitle: true,
          actions: [
            TextButton.icon(
                onPressed:() async{
                  await _auth.signOut();
                },
                icon:Icon(Icons.logout),
                label:Text("LOGOUT"),
              style: TextButton.styleFrom(
                primary: Colors.grey[800],
                backgroundColor: Colors.blueAccent,
              ),
            )
          ],
          backgroundColor: Colors.blueAccent,
        ),
      )
    );
  }
}
