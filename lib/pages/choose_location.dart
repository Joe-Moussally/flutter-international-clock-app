import 'package:flutter/material.dart';
import 'package:international_clock_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'https://www.kidlink.org//icons/f0-uk.gif'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'https://www.kidlink.org//icons/f0-gr.gif'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'https://www.kidlink.org//icons/f0-eg.gif'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'https://www.kidlink.org//icons/f0-ke.gif'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'https://www.kidlink.org//icons/f0-us.gif'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'https://www.kidlink.org//icons/f0-us.gif'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'https://www.kidlink.org//icons/f0-kr.gif'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'https://www.kidlink.org//icons/f0-id.gif'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDay": instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    print("INIT STATE FUNCTION RAN");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flag),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
