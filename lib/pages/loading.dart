import 'package:flutter/material.dart';
import 'package:new_project/services/world_time.dart';
import 'dart:core';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {

    WorldTime instance = WorldTime(
        location: "Berlin", flag: 'germany.png', url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
    print("initState FUnction run ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body:Center(
          child:SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ) ,
        )
    );
  }
}
