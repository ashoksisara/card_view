import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final LatLng initialLatLng;
  final bool isFromFullScreen;

  const MapView(
      {Key? key, required this.initialLatLng, this.isFromFullScreen = true})
      : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    animateCamera();
    super.initState();
  }

  Future<void> animateCamera() async {
    final GoogleMapController controller = await _controller.future;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: widget.initialLatLng, zoom: 17),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: const CameraPosition(
        target: LatLng(52.120, 0.9),
        zoom: 8,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('property_position'),
          position: widget.initialLatLng,
        )
      },
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (argument) {
        if(!widget.isFromFullScreen){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MapView(initialLatLng: widget.initialLatLng),
            ),
          );
        }
      },
      gestureRecognizers: {
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
    );
  }
}
