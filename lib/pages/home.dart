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
    routeData = routeData.isNotEmpty
        ? routeData
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // set the background image
    String backgroundName = routeData["isDay"] ? "day.jpeg" : "night.jpeg";

    // status color - android only
    Color statusColor =
        routeData["isDay"] == true ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: statusColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$backgroundName'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic res =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        routeData = {
                          "time": res["time"],
                          "location": res["location"],
                          "flag": res["flag"],
                          "isDay": res["isDay"]
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(color: Colors.grey[300]),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      routeData["location"],
                      style: TextStyle(
                          fontSize: 27, letterSpacing: 2, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  routeData["time"],
                  style: TextStyle(fontSize: 60, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
