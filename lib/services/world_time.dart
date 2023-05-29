import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name
  String time = "";
  String flag;
  String url;
  late bool isDay;

  WorldTime({
    this.location = "",
    this.flag = "",
    this.url = "",
  });

  Future<void> getTime() async {
    try {
      var apiUrl = Uri.http('worldtimeapi.org', 'api/timezone/$url');
      var response = await http.get(apiUrl);
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      // isDay = now.hour > 6 && now.hour < 20 ? true : false;
      isDay = true;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Could not get time data";
    }
  }
}
