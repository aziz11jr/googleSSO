import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../flavors/flavor_config.dart';

class DioClient {
  /// Dio Clients
  late Dio dio;
  late Dio dioEdge;
  late Dio dioKeycloak;
  late Dio dioDataScience;

  /// Dio Client Configuration
  // receiveTimeout
  final int receiveTimeout = 20000;

  // connectTimeout
  final int connectionTimeout = 20000;

  /// Static field with getter
  static final DioClient _dioClient = DioClient._internal();

  static DioClient get dioClient => _dioClient;

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  DioClient._internal() {
    // Base Options
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
    );

    final BaseOptions baseOptionsEdge = BaseOptions(
      baseUrl: FlavorConfig.instance.edgeBaseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.json,
    );

    final BaseOptions baseOptionsKeycloak = BaseOptions(
      baseUrl: FlavorConfig.instance.keycloakBaseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.json,
    );

    final BaseOptions baseOptionDataScience = BaseOptions(
      baseUrl: FlavorConfig.instance.dataScienceBaseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.json,
    );

    /// Create dio clients
    dio = Dio(baseOptions)
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ),
      );

    dioEdge = Dio(baseOptionsEdge)
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ),
      );

    dioKeycloak = Dio(baseOptionsKeycloak)
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ),
      );

    dioDataScience = Dio(baseOptionDataScience)
      ..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ),
      );
  }
}
