import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              // onPressed: getLocation,
            ),
            Container(
              child: Column(
                  children: [
                    Text('hasil'),
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
