// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:international_clock_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime berlin =
        WorldTime(location: "Berlin", flag: "", url: "Europe/Berlin");
    await berlin.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": berlin.location,
      "flag": berlin.flag,
      "time": berlin.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 105,
        ),
      ),
    );
  }
}
