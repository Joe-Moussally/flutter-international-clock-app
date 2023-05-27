import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    var url = Uri.http('worldtimeapi.org', 'api/timezone/Europe/London');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);

    // create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print('HELLO ${now}');
  }

  @override
  void initState() {
    super.initState();
    print("RAN IN LOADING SCREEN");
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("LOADING"),
    );
  }
}
