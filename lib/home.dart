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
  List<Placemark> placemarks;
  Future<Map<String, dynamic>> datalokasi;
  // String jalan;
  // String sublokal;
  // String locality;
  // String kota;
  // String prov;
  // String kodepos;
  // String negara;

  // @override
  // void initState(){
  //   super.initState();
  // }

  Future<Map<String,dynamic>> getLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    placemarks = await placemarkFromCoordinates(lat, long);
    // print(placemarks[0]);
    // jalan = placemarks[0].street.toString();
    // sublokal = placemarks[0].subLocality.toString();
    // locality = placemarks[0].locality.toString();
    // kota = placemarks[0].subAdministrativeArea.toString();
    // prov = placemarks[0].administrativeArea.toString();
    // kodepos = placemarks[0].postalCode.toString();
    // negara = placemarks[0].country.toString();
    // print(jalan);
    latlong = "$lat ; $long";
    // lokasi = "$jalan, $sublokal, $locality, $kota, $prov $kodepos, $negara";
    lokasi = "${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].administrativeArea} ${placemarks[0].postalCode}, ${placemarks[0].country}";
    return{
      "latlong": latlong,
      "lokasi": lokasi
    };
  }

  getData() async{
    setState(() {
      datalokasi = getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Get Location'),
                onPressed: (){
                  getData();
                },
              ),
              Container(
                child: FutureBuilder<Map<String,dynamic>>(
                  future: getLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('an error accured');
                    } else {
                      return Column(
                        children: [
                          Text(snapshot.data['latlong']),
                          Text(snapshot.data['lokasi'])
                        ],
                      );
                    }
                  }

                  // child: Column(
                  //     children: [
                  //       Text('$latlong'),
                  //       Text('$lokasi')
                  //     ]
                  // ),
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
