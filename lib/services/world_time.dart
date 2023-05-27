import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  String location; // location name
  String time;
  String flag;
  String url;

  WorldTime(
      {required this.location,
      required this.time,
      required this.flag,
      required this.url});

  void getTime() async {
    var API_url = Uri.http('worldtimeapi.org', 'api/timezone/$url');
    var response = await http.get(API_url);
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);

    // create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set time property
    time = now.toString();
  }
}
