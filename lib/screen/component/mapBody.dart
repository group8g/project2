import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatefulWidget {
  const MapBody({Key? key}) : super(key: key);

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  // Map Cotroller
  final Completer<GoogleMapController> _controller = Completer();
  // to save locations
  Set<Marker> _marker = {};

  // start state (location, zoom)
  static const CameraPosition _KeyGoogle = CameraPosition(
    target: LatLng(31.9238508, 35.7613805),
    zoom: 12,
  );

  // to test Permission aggread
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("erroe" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // to get start state
        initialCameraPosition: _KeyGoogle,
        // to intialize added location (to _marker)
        markers: Set<Marker>.of(_marker),
        // created state
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // to apper added markers and current location
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 160),
        child: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              // to add location to _marker (and current location)
              _marker.addAll({
                ///////////////////(total)/////////////////////////////////////////////////////////////////////
                Marker(
                  markerId: MarkerId('id-1'),
                  position: LatLng(32.0609712, 35.9137518),
                  infoWindow: InfoWindow(
                    title: 'Total (Sweileh)',
                    snippet: 'Gasoline, Oil change, Car Wash,Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-2'),
                  position: LatLng(32.0609712, 35.9137518),
                  infoWindow: InfoWindow(
                    title: 'Total (Al Jubaiha)',
                    snippet: 'Diesel, Oil Change, Car Wah',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-3'),
                  position: LatLng(32.0601119, 35.9115092),
                  infoWindow:
                      InfoWindow(title: 'Total (Almanhal)', snippet: 'Diesel'),
                ),
                Marker(
                  markerId: MarkerId('id-4'),
                  position: LatLng(32.0612256, 35.9186327),
                  infoWindow: InfoWindow(
                      title: 'Total (Al-Mutkamleh)', snippet: 'Diesel'),
                ),
                Marker(
                  markerId: MarkerId('id-5'),
                  position: LatLng(32.0017732, 36.0981869),
                  infoWindow: InfoWindow(
                    title: 'Total (Jordanian University Street',
                    snippet: 'Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-6'),
                  position: LatLng(32.0344534, 35.9182894),
                  infoWindow: InfoWindow(
                    title: 'Total (Al Madina Al Monawara)',
                    snippet: 'Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-7'),
                  position: LatLng(32.0344534, 35.9182894),
                  infoWindow: InfoWindow(
                      title: 'Total (Al Madina Al Monawara)',
                      snippet: 'Disael, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-8'),
                  position: LatLng(31.8857022, 36.0094929),
                  infoWindow: InfoWindow(
                    title: 'Total (Al Madina Al Monawara)',
                    snippet: 'Disael, Oil Chnage',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-9'),
                  position: LatLng(32.0345287, 35.9372299),
                  infoWindow: InfoWindow(
                      title: 'Total (Gardens)',
                      snippet: 'Gasoline, Diesel, Oil Change, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-10'),
                  position: LatLng(32.0338206, 35.9257801),
                  infoWindow:
                      InfoWindow(title: 'Total', snippet: 'Disale, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-11'),
                  position: LatLng(32.0354214, 35.9377964),
                  infoWindow: InfoWindow(
                      title: 'Total (Sport City)',
                      snippet: 'Gasoline, Diesal, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-12'),
                  position: LatLng(31.9486927, 35.9303869),
                  infoWindow: InfoWindow(
                      title: 'Total (Medical City)', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-13'),
                  position: LatLng(31.9328146, 35.935365),
                  infoWindow: InfoWindow(
                      title: 'Total (Mecca Street)',
                      snippet: 'Gasoline, Diesal, Oil Change, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-14'),
                  position: LatLng(31.9328146, 35.935365),
                  infoWindow: InfoWindow(
                      title: 'Total (Mecca Street)',
                      snippet: 'Gasoline, Diesal, Oil change, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-15'),
                  position: LatLng(31.9315023, 35.9311771),
                  infoWindow: InfoWindow(
                    title: 'Total',
                    snippet: 'Gasoline, Oil Change, Diesa',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-16'),
                  position: LatLng(31.9188366, 35.9462821),
                  infoWindow: InfoWindow(
                      title: 'Total (Wadi Abdoun)',
                      snippet: 'Diesal, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-17'),
                  position: LatLng(31.9188366, 35.9462821),
                  infoWindow: InfoWindow(
                      title: 'Total (Wadi Saqra)',
                      snippet: 'Gasoline, Diesal, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-18'),
                  position: LatLng(31.9188366, 35.9462821),
                  infoWindow: InfoWindow(title: 'Total ', snippet: ''),
                ),
                Marker(
                  markerId: MarkerId('id-19'),
                  position: LatLng(31.9188366, 35.9462821),
                  infoWindow: InfoWindow(
                    title: 'Total (Abdali)',
                    snippet: 'Gasoline, Oil Change, Diesa, Car Wash',
                  ),
                ),
                /////////////////(Zarqa)/////////////////////
                Marker(
                  markerId: MarkerId('id-20'),
                  position: LatLng(32.0156417, 36.0912091),
                  infoWindow: InfoWindow(
                      title: 'Total (Rusiffi)',
                      snippet: 'Gasoline, Diesal, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-21'),
                  position: LatLng(32.0156417, 36.0912091),
                  infoWindow: InfoWindow(
                      title: 'Total(Zarqa Highway) ',
                      snippet: 'Gasoline, Diesal, Oil Change'),
                ),
                Marker(
                  markerId: MarkerId('id-22'),
                  position: LatLng(32.0084932, 36.1216409),
                  infoWindow: InfoWindow(
                    title: 'Total',
                    snippet: 'Diesa',
                  ),
                ),
                //////////////////////////////////////(joPetrol)///////////////////////////////////////////////////////
                Marker(
                  markerId: MarkerId('id-23'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.0043944, 36.1100739),
                  infoWindow: InfoWindow(
                    title: 'JoPetrol',
                    snippet: '',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-24'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.8122513, 36.0111357),
                  infoWindow: InfoWindow(
                    title: 'JoPetrol',
                    snippet: 'Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-25'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.885407, 36.1468817),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: ''),
                ),
                Marker(
                  markerId: MarkerId('id-26'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.885407, 36.1468817),
                  infoWindow: InfoWindow(
                      title: 'Total (Al-Mutkamleh)', snippet: 'Diesel'),
                ),
                Marker(
                  markerId: MarkerId('id-27'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.9293251, 35.9915268),
                  infoWindow: InfoWindow(
                    title: 'JoPetrol',
                    snippet: 'Gasoline ,Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-28'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.8782136, 36.18436),
                  infoWindow: InfoWindow(
                    title: 'JoPetrol',
                    snippet: 'Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-29'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.910478, 35.8906729),
                  infoWindow: InfoWindow(
                      title: 'JoPetrol',
                      snippet: 'Gasoline, Disael, Oil Change, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-30'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.9167552, 35.8616989),
                  infoWindow: InfoWindow(
                    title: 'JoPetrol',
                    snippet: 'Gasoline',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-31'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.9522623, 35.9264782),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: 'Diesel'),
                ),
                Marker(
                  markerId: MarkerId('id-32'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.9123318, 35.9834156),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: 'Disale'),
                ),
                /////////////////(Zarqa)/////////////////////
                Marker(
                  markerId: MarkerId('id-33'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.10604, 36.1154723),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-34'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.08783, 36.111184),
                  infoWindow: InfoWindow(title: 'JoPetrol ', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-35'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.0673947, 36.0763432),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-36'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.0400553, 36.0931097),
                  infoWindow: InfoWindow(
                      title: 'JoPetrol', snippet: 'Gasoline, Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-37'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(32.0138648, 36.0281228),
                  infoWindow: InfoWindow(
                      title: 'JoPetrol', snippet: 'Gasoline, Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-38'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position: LatLng(31.9922067, 35.9854998),
                  infoWindow: InfoWindow(title: 'JoPetrol', snippet: 'Diesal'),
                ),
                //////////////////////////////////////(Manaseer)///////////////////////////////////////////////////////
                Marker(
                  markerId: MarkerId('id-39'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(32.0213259, 35.8611296),
                  infoWindow: InfoWindow(
                    title: 'Manaseer',
                    snippet: '',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-40'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9920215, 35.936232),
                  infoWindow: InfoWindow(
                    title: 'Manaseer',
                    snippet: 'Gasoline, Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-41'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.97682, 35.888463),
                  infoWindow: InfoWindow(title: 'Manaseer', snippet: ''),
                ),
                Marker(
                  markerId: MarkerId('id-42'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9642143, 35.8883267),
                  infoWindow: InfoWindow(title: 'Manaseer', snippet: 'Diesel'),
                ),
                Marker(
                  markerId: MarkerId('id-43'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.970622, 36.0242825),
                  infoWindow: InfoWindow(
                    title: 'Manaseer',
                    snippet: 'Gasoline ,Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-44'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.945908, 35.844392),
                  infoWindow: InfoWindow(
                    title: 'Manaseer',
                    snippet: 'Gasoline, Diesel',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-45'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9328236, 35.9338728),
                  infoWindow: InfoWindow(
                      title: 'Manaseer', snippet: 'Gasoline, Disael, Car Wash'),
                ),
                Marker(
                  markerId: MarkerId('id-46'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9109989, 35.8967445),
                  infoWindow: InfoWindow(
                    title: 'Manaseer',
                    snippet: 'Gasoline',
                  ),
                ),
                Marker(
                  markerId: MarkerId('id-47'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9702179, 36.0012095),
                  infoWindow: InfoWindow(
                      title: 'Manaseer', snippet: 'Gasoline, Diesel'),
                ),
                /////////////////(Zarqa)/////////////////////
                Marker(
                  markerId: MarkerId('id-48'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(32.0866651, 36.3445973),
                  infoWindow: InfoWindow(title: 'Manasser', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-49'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(31.9964798, 36.0281678),
                  infoWindow: InfoWindow(title: 'Manaseer ', snippet: 'Diesal'),
                ),
                Marker(
                  markerId: MarkerId('id-50'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(32.0529168, 36.0846975),
                  infoWindow: InfoWindow(
                      title: 'Manaseer', snippet: 'Diesal, Gasoline'),
                ),
                Marker(
                  markerId: MarkerId('id-51'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  position: LatLng(32.0865786, 36.2045824),
                  infoWindow: InfoWindow(
                      title: 'Manaseer', snippet: 'Gasoline, Diesal'),
                ),
                // current location marker
                Marker(
                  markerId: MarkerId('id-52'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange),
                  position:
                      LatLng(32.1028831, 36.1833102), // (value.lat, value.long)
                  infoWindow: InfoWindow(title: 'Your Location'),
                )
              });
              // current location
              CameraPosition cameraPosition = CameraPosition(
                zoom: 9.5,
                target:
                    LatLng(32.1028831, 36.1833102), // (value.lat, value.long)
              );

              //
              final GoogleMapController controller = await _controller.future;
              //
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {});
            });
          },
          child: (Icon(Icons.location_pin)),
        ),
      ),
    );
  }
}
