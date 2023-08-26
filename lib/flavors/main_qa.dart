import 'package:vds_culture_tech/flavors/flavor_enum.dart';

import '../flavors/flavor_config.dart';
import '../main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Load qa environment file content
  await dotenv.load(fileName: ".env.qa");
  // Inject dev config configurations
  FlavorConfig.instance.flavor = Flavor.qa;
  FlavorConfig.instance.hostBaseUrl = dotenv.env["HOST_BASE_URL"] ?? "";
  FlavorConfig.instance.edgeBaseUrl = dotenv.env["EDGE_BASE_URL"] ?? "";
  FlavorConfig.instance.keycloakBaseUrl =
      dotenv.env["KEY_CLOACK_BASE_URL"] ?? "";
  FlavorConfig.instance.dataScienceBaseUrl = dotenv.env[""] ?? "";

  // Call main common
  mainCommon();
}
