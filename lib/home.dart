import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String latlong= '-';
  String lokasi = '-';
  String jalan;
  String sublokal;
  String locality;
  String kota;
  String prov;
  String kodepos;
  String negara;

  List<Placemark> placemarks;

  void getLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0]);
    jalan = placemarks[0].street.toString();
    sublokal = placemarks[0].subLocality.toString();
    locality = placemarks[0].locality.toString();
    kota = placemarks[0].subAdministrativeArea.toString();
    prov = placemarks[0].administrativeArea.toString();
    kodepos = placemarks[0].postalCode.toString();
    negara = placemarks[0].country.toString();
    print(jalan);

    setState(() {
      latlong = "$lat ; $long";
      lokasi = "$jalan, $sublokal, $locality, $kota, $prov $kodepos, $negara";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPSs'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      Text('$latlong'),
                      Text('$lokasi')
                    ]
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),

            ]
          )
        ),
      )
    );
  }
}
