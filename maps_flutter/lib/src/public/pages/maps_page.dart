import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final LatLng _center = const LatLng(3.4359274, -76.5670537);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                compassEnabled: true,
                mapType: MapType.normal,
                markers: _getMarkers(),
                initialCameraPosition: CameraPosition(target: _center, zoom: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _getMarkers() {
    Set<Marker> markets = Set();
    markets.add(Marker(
      markerId: MarkerId("1"),
      icon: BitmapDescriptor.defaultMarker,
      position: _center,
      infoWindow: InfoWindow(
        title: "Marcador",
        snippet: "Descripción"
      )
    ));

    markets.add(Marker(
      markerId: MarkerId("2"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: LatLng(3.434343,-76.557222),
      infoWindow: InfoWindow(
        title: "Marcador 2",
        snippet: "Descripción 2"
      )
    ));

    return markets;
  }
}
