// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// screens
import 'package:international_clock_app/pages/choose_location.dart';
import 'package:international_clock_app/pages/home.dart';
import 'package:international_clock_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
      initialRoute: '/',
    ));
