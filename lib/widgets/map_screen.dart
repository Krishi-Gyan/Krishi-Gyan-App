import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen() : super(key: const Key('MapScreen'));

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng targetLocation =
      LatLng(28.621167966628416, 77.13521164582943);
  static const LatLng sourceLocation =
      LatLng(28.61296241623541, 77.22949871764727);

  List<LatLng> polyLineCoordinates = [];

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/Pin_source.png')
        .then(
      (value) => sourceIcon = value,
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/Pin_destination.png')
        .then(
      (value) => destinationIcon = value,
    );
  }

  Future<void> getPolyLine() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "",
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(targetLocation.latitude, targetLocation.longitude),
      wayPoints: [],
    );

    if (result.points.isNotEmpty) {
      for (var element in result.points) {
        polyLineCoordinates.add(
          LatLng(element.latitude, element.longitude),
        );
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPolyLine();
    setCustomMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: targetLocation,
        zoom: 15,
      ),
    );
  }
}
