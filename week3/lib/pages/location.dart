import 'package:flutter/material.dart';
import 'package:world_time/service/worldTime.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  List<Worldtime> locations=[
    Worldtime(url:'America/New_York' ,location:'New York' , flag:'america.png'  ),
    Worldtime(url:'Asia/Qatar' ,location:'Qatar' , flag:''  ),
    Worldtime(url:'Asia/Kuala_Lumpur' ,location:'Kuala Lumpur' , flag:''  ),
    Worldtime(url:'Europe/Amsterdam' ,location:'Amsterdam' , flag:''  ),
    Worldtime(url:'Asia/Singapore' ,location:'Singapore' , flag:''  )
  ];

void updateTime(index) async{
  Worldtime instance = locations[index];
  await instance.getData();
  Navigator.pop(context ,{
  'location': instance.location,
  'flag':instance.flag,
  'time':instance.time
  }
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title:Text('Location'),
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);

                },
                title: Text(locations[index].location),
              ),
            );
          } )
    );
  }
}
