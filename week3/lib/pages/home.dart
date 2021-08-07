import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: ()async{
                   dynamic result=await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = result;
                   });
                  },
                  icon:Icon(
                    Icons.edit_location,
                    color: Colors.orange,
                  ),
                  label: Text(
                      "edit location",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,

                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(data['time'],style:TextStyle(fontSize:70),)

              ],
            ),
          )
      ),
    );
  }
}
