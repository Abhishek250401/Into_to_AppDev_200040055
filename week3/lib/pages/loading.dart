import 'package:flutter/material.dart';
import 'package:world_time/service/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String time = 'loading';
  void setUp()async{

    Worldtime instance = Worldtime(location: 'Kolkata', flag: 'Kolkata.png', url: 'Asia/Kolkata');
   await instance.getData();
   Navigator.pushReplacementNamed(context,'/home',arguments:{
     'location': instance.location,
     'flag':instance.flag,
     'time':instance.time
   }
   );
  }


  @override
  void initState() {
    super.initState();
    setUp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitRotatingCircle(
          color: Colors.blue[800],
          size: 50.0,
        ),
      ),
    );
  }
}
