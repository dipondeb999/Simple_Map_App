import 'package:flutter/material.dart';
import 'package:map_app/ui/screens/map_screen.dart';

class MapAApp extends StatelessWidget {
  const MapAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}
