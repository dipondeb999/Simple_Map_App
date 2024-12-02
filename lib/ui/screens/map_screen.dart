import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 15,
          target: LatLng(
            24.530601652086695,
            91.72512379949839,
          ),
        ),
        onTap: (LatLng? latLng) {
          print(latLng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        trafficEnabled: true,
        markers: <Marker> {
          Marker(
            markerId: const MarkerId('initial-position'),
            position: const LatLng(
              24.530601652086695,
              91.72512379949839,
            ),
            infoWindow: InfoWindow(
              title: 'Home',
              onTap: () {
                print('On tapped home');
              }
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
            draggable: true,
            onDragStart: (LatLng onStartLatLng) {
              print('On start drag $onStartLatLng');
            },
            onDragEnd: (LatLng onEndLatLng) {
              print('On end drag $onEndLatLng');
            },
          ),
          const Marker(
            markerId: MarkerId('current-position'),
            position: LatLng(
              24.523526965708893,
              91.72782842069864,
            ),
          ),
        },
        circles: <Circle> {
          Circle(
            circleId: const CircleId('initial-circle'),
            center: const LatLng(
              24.526033381846073,
              91.71948004513979,
            ),
            fillColor: Colors.red.withOpacity(0.2),
            radius: 500,
            strokeWidth: 0,
            visible: true,
            onTap: () {
              print('Entered danger zone!');
            }
          ),
          Circle(
              circleId: const CircleId('blue-circle'),
              center: const LatLng(
                  24.51814549046523,
                  91.73030443489552,
              ),
              fillColor: Colors.blue.withOpacity(0.2),
              radius: 800,
              strokeWidth: 0,
              visible: true,
              onTap: () {
                print('Entered blue zone!');
              }
          ),
        },
        polylines: <Polyline> {
          const Polyline(
            polylineId: PolylineId('random'),
            points: <LatLng> [
              LatLng(24.52791049218957, 91.70756936073303),
              LatLng(24.512988916763383, 91.70360773801804),
              LatLng(24.50089527468249, 91.70935872942209),
            ],
            color: Colors.green,
            width: 4,
            jointType: JointType.round,
          ),
        },
        polygons: <Polygon> {
          Polygon(
            polygonId: const PolygonId('poly-id'),
            points: const <LatLng> [
              LatLng(24.49778488323541, 91.71030253171921),
              LatLng(24.48600954704024, 91.71923864632845),
              LatLng(24.493877487951668, 91.72974117100239),
              LatLng(24.506866583443077, 91.72904513776302),
              LatLng(24.50433232790115, 91.71494476497173),
            ],
            fillColor: Colors.green.withOpacity(0.2),
            strokeWidth: 0,
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                zoom: 16,
                target: LatLng(
                  24.530601652086695,
                  91.72512379949839,
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.location_history),
      ),
    );
  }
}
