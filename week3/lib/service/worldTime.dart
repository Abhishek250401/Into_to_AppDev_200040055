import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime{

  String location;
 late String time;
  String flag;
  String url;

  Worldtime({required this.location,required this.flag,required this.url});

  Future<void> getData() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset_hours= (data['utc_offset']).substring(1,3);
    String offset_min= (data['utc_offset']).substring(4,6);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset_hours),minutes:int.parse(offset_min)));
    time= DateFormat.jm().format(now);

  }
}
