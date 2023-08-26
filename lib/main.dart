import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vds_culture_tech/services/geolocator_permission.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_enum.dart';
import 'views/home_page.dart';

void mainCommon() async {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locationPermissionDeniedMessage = 'Access denied';

  void updateLocationPermissionDeniedMessage(String message) {
    locationPermissionDeniedMessage = message;
  }

  @override
  void initState() {
    checkLocationPermission(
        onPermissionDenied: updateLocationPermissionDeniedMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: FlavorConfig.instance.flavor == Flavor.dev
            ? Colors.purple
            : Colors.orange,
      ),
      home: const HomePage(title: 'Culture Tech'),
    );
  }
}
