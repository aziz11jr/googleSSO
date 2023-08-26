import 'dart:core';
import 'package:dio/dio.dart';
import 'package:vds_culture_tech/data/connection/dio_client.dart';
import 'package:vds_culture_tech/model/sites.dart';
import '../../../utils/constants.dart';
import '../dio_exceptions.dart';

class SitesRepository {
  //Dio Edge Client
  final dioDataScience = DioClient.dioClient.dioDataScience;

  Future<List<Sites>> getAllSites(
    double latitude,
    double longitude,
  ) async {
    try {
      final Response response = await dioDataScience.post(
        Constants.getData,
        data: {
          'Latitude': 33.887923,
          'Longitude': 10.098633,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      final listSites =
          (response.data as List).map((e) => Sites.fromJson(e)).toList();
      return listSites;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
