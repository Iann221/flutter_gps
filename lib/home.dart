import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String latitude = '-';
  String longitude = '-';

  void getLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    setState(() {
      latitude = "$lat";
      longitude = "$long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Get Location'),
              onPressed: (){
                getLocation();
              },
            ),
            Container(
              child: Column(
                  children: [
                    Text('$latitude ; $longitude'),
                  ]
              ),
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),

          ]
        )
      )
    );
  }
}
