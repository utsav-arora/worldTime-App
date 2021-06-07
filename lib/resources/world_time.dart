import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String flag;
  String time;
  String location;
  String url;
  bool isDaytime;

  WorldTime({this.location , this.flag , this.url});

  Future<void> getTime()
  async{



    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour>6 && now.hour<20 ? true : false;
    time= DateFormat.jm().format(now);



  }
}