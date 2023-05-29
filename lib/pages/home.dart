import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> routeData = {};

  @override
  Widget build(BuildContext context) {
    routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(routeData);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    routeData["location"],
                    style: TextStyle(fontSize: 27, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                routeData["time"],
                style: TextStyle(fontSize: 60),
              )
            ],
          ),
        ),
      ),
    );
  }
}
