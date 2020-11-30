import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

main() {
  runApp(MaterialApp(home: MyGoogleMap()));
}

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  List<Marker> myMarker = [];
  lw() async {
    var p = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(p);
  }

  @override
  Widget build(BuildContext context) {
    var cp = CameraPosition(
      target: LatLng(23.225306, 77.393824),
      zoom: 19,
      tilt: 50,
    );

    return Scaffold(
      body: GoogleMap(
        // YOUR MARKS IN MAP,
        initialCameraPosition: cp,
        mapType: MapType.normal,
        markers: Set.from(myMarker),
        onTap: handleTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lw,
        child: Icon(Icons.add),
      ),
    );
  }

  handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()), position: tappedPoint));
    });
  }
}
