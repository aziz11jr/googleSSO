import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {
  const Gmap({super.key});

  @override
  State<Gmap> createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  late BitmapDescriptor markerIcon;
  Set<Marker> mymarker = {};

  @override
  void initState() {
    setMarkerCustomImage("assets/icons/Pin_jaune.png", '2',
        const LatLng(36.80173564796666, 10.16914573864727));
    setMarkerCustomImage("assets/icons/Pin_rouge.png", '3',
        const LatLng(36.80273564796666, 10.17914573864727));
    setMarkerCustomImage("assets/icons/Pin_vert.png", '4',
        const LatLng(36.81173564796666, 10.18914573864727));

    super.initState();
  }

  late GoogleMapController mapController;
  setMarkerCustomImage(String path, String id, LatLng positionn) async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      path,
    ).then((value) => {
          markerIcon = value,
          mymarker.addAll({
            Marker(
              consumeTapEvents: false,
              anchor: const Offset(0.5, 1),
              zIndex: 3.2, //qui s'affiche en premier
              alpha: 1, //opacité du marker
              markerId: MarkerId(id),
              position: positionn,
              icon: markerIcon,
            ),
          }),
          setState(() {})
        });
  }

  final LatLng _center = const LatLng(36.798, 10.1717);

  @override
  Widget build(BuildContext context) {
    const currentLocationCamera = CameraPosition(
      target: LatLng(36.80173564796666, 10.16914573864727),
      zoom: 14.4746,
    );

    final googleMap = StreamBuilder<List<Marker>>(builder: (context, snapshot) {
      return GoogleMap(
        zoomControlsEnabled: false,
        markers: mymarker,

        initialCameraPosition: currentLocationCamera,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;

          mapController.setMapStyle(
              '[ { "featureType": "administrative", "elementType": "labels.text.fill", "stylers": [ { "color": "#444444" } ] }, { "featureType": "administrative.country", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.country", "elementType": "geometry", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.country", "elementType": "geometry.fill", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.country", "elementType": "geometry.stroke", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.province", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.locality", "elementType": "labels", "stylers": [ { "hue": "#ffe500" } ] }, { "featureType": "landscape", "elementType": "all", "stylers": [ { "color": "#f2f2f2" }, { "visibility": "on" } ] }, { "featureType": "landscape.natural", "elementType": "all", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.landcover", "elementType": "all", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "all", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "geometry", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "geometry.fill", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "geometry.stroke", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "labels", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "labels.text", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "labels.text.fill", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "labels.text.stroke", "stylers": [ { "visibility": "on" } ] }, { "featureType": "landscape.natural.terrain", "elementType": "labels.icon", "stylers": [ { "visibility": "on" } ] }, { "featureType": "poi", "elementType": "all", "stylers": [ { "visibility": "on" } ] }, { "featureType": "poi.attraction", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.attraction", "elementType": "labels", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.business", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.business", "elementType": "labels", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.government", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.medical", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "visibility": "on" } ] }, { "featureType": "poi.place_of_worship", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.school", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.sports_complex", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "road", "elementType": "all", "stylers": [ { "saturation": -100 }, { "lightness": 45 }, { "visibility": "on" } ] }, { "featureType": "road.highway", "elementType": "all", "stylers": [ { "visibility": "simplified" } ] }, { "featureType": "road.arterial", "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "featureType": "road.local", "elementType": "labels.text", "stylers": [ { "visibility": "on" } ] }, { "featureType": "transit", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "transit.line", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "transit.station", "elementType": "all", "stylers": [ { "visibility": "off" } ] }, { "featureType": "transit.station.airport", "elementType": "all", "stylers": [ { "visibility": "on" } ] }, { "featureType": "water", "elementType": "all", "stylers": [ { "color": "#9bdffb" }, { "visibility": "on" } ] } ] ');
        },
        // markers: Set<Marker>.of(snapshot.data ?? []),
        // padding: const EdgeInsets.all(8),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          googleMap,
        ],
      ),
    );
  }
}
