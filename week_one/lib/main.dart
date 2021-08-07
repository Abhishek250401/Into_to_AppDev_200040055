import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
)
);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int firstnum =0;
  int secondnum=0 ;
  String display = "0";
  String result = "";
  String operation = "";

  void click(String btntext) {
    if (btntext == "CLEAR") {
      display = "";
      firstnum = 0;
      secondnum = 0;
      result = "0";
    }
    else if (btntext == "+" || btntext == "-" || btntext == "X" || btntext == "/") {
      firstnum = int.parse(display);
      result = "";
      operation = btntext;
    }
    else if (btntext == ".") {
      if (display.contains(".")) {
        print("error");
        return;
      }
      else {
        firstnum = int.parse(display);
        result = "";
        operation = btntext;
      }
    }
    else if (btntext == "="){
      secondnum=int.parse(display);
      if(operation== "+"){
        result=(firstnum + secondnum).toString();
      }
      if(operation== "-"){
        result=(firstnum - secondnum).toString();
      }
      if(operation== "X"){
        result=(firstnum * secondnum).toString();
      }
      if(operation== "/"){
        result=(firstnum / secondnum).toString();
      }
      if(operation== "."){
        result=(firstnum.toString()+"." + secondnum.toString()).toString();
      }
      firstnum=0;
      secondnum=0;
      operation="";

    }

    else{
      result=int.parse(display + btntext).toString();
    }
    setState(() {
      display=result;

    });

  }









  Widget button(String val){
    return  Expanded(child:Container(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          color: Colors.grey[800],
          margin: EdgeInsets.all(1),
          child: MaterialButton(
            onPressed: () => click(val),
            child: Text("$val", style: TextStyle(fontSize: 30.0,
              color: Colors.blueAccent,),
            ),
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment:Alignment.topRight,
                  child: Text(
                    "$display",
                    style: TextStyle(
                      color:Colors.blue,
                      fontSize: 50,
                      fontWeight:FontWeight.bold,
                    ),
                  ),

                ),
              ),
            ),
             Divider(
              color: Colors.grey[800],
              height: 150,
              thickness: 2,
            ),
            Row(
              children: [
                button("7"),
                button('8') ,
                button('9') ,
                button('/') ,


              ],
            ),
            Row(
              children: [
                button('4'),
                button('5'),
                button('6'),
                button('X'),
              ],
            ),
            Row(
              children: [
                button('1'),
                button('2'),
                button('3'),
                button('-'),
              ],
            ),
            Row(
              children: [
                button('.'),
                button('0'),
                button('00'),
                button('+'),
              ],
            ),
            Row(
                children: [
                  button('CLEAR'),
                  button('='),
                ]
            ),


          ],
        ),
      ),
    );
  }
}
