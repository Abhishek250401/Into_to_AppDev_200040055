import 'package:appdev2/support/q.dart';
import 'package:flutter/material.dart';

class  home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("QUIZ APP",style:TextStyle(color:Colors.white,fontSize:18),)),
      backgroundColor:Colors.grey[900] ,),
       backgroundColor:Colors.grey[800],

        body:Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[Center(
            child: Container(
              decoration: BoxDecoration(
                color:Colors.blue,
             borderRadius: BorderRadius.circular(18),),
              padding: EdgeInsets.all(16),
              child:TextButton(
              onPressed:(){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=> Quiz()));
              },
              child: Text(
                  "Take Quiz",
                style:TextStyle(
                  color:Colors.white,
                  fontSize: 18,
                )
              ),
            ),
            ),
          ),
           ],
          ),

        ),
      );
  }
}
