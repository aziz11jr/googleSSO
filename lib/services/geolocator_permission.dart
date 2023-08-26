import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

typedef PermissionDeniedCallback = void Function(String message);

void checkLocationPermission(
    {required PermissionDeniedCallback onPermissionDenied}) async {
  PermissionStatus permissionStatus = await Permission.locationWhenInUse.status;
  if (permissionStatus.isDenied) {
    permissionStatus = await Permission.locationWhenInUse.request();
    if (permissionStatus.isDenied) {
      return;
      // Provide alternative options or update the UI accordingly.
    }
  } else if (permissionStatus.isGranted) {
    // Permission already granted, proceed to get the current location.

    return getLocation();
  }
}

void getLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  } catch (e, s) {
    print("****Error is****: ${e} and ****stacktrace is****: ${s}");
  }
}
