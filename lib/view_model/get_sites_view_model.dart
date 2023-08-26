import 'package:vds_culture_tech/data/connection/repository/sites_repository.dart';
import 'package:vds_culture_tech/model/sites.dart';

class GetAllSites {
  List<Sites> allsites = [];

  Future<void> getAllSitesList(
    double latitude,
    double longitude,
  ) async {
    try {
      allsites = await SitesRepository().getAllSites(latitude, longitude);
    } catch (e) {
      // inside catch
    }
  }
}
