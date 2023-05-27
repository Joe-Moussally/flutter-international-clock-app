import 'package:flutter/material.dart';
import 'package:international_clock_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() {
    WorldTime berlin =
        WorldTime(location: "Berlin", time: "", flag: "", url: "Europe/Berlin");
    berlin.getTime();
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("LOADING"),
    );
  }
}
