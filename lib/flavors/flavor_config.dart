import 'flavor_enum.dart';

class FlavorConfig {
  late Flavor flavor;
  // Config Variables
  String hostBaseUrl = "";
  String edgeBaseUrl = "";
  String keycloakBaseUrl = "";
  String dataScienceBaseUrl = "";

  static FlavorConfig _instance = FlavorConfig._internal();

  factory FlavorConfig() {
    _instance = FlavorConfig._internal();
    return _instance;
  }

  FlavorConfig._internal();

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isDev() => _instance.flavor == Flavor.dev;
  static bool isQa() => _instance.flavor == Flavor.qa;
}
