import 'dart:io' show SocketException;

import 'package:exp_with_leaflet/app_level/models/api_response.dart';
import 'package:exp_with_leaflet/app_level/utilities/exception_handler.dart';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class MapsService {
  MapsService();

  final String _baseUrl =
      'https://native-land.ca/api/index.php?maps=languages,territories,treaties';

  Future<List<MapResponse>> getRoute() => _getRoute();

  // --------------------------------------------- INTERNALS ---------------------------------------------

  static final _serviceLogger = Logger('MapsService');

  Future<List<MapResponse>> _getRoute({
    double lat = 48.427920,
    double long = -123.358090,
  }) async {
    //
    var _url = '$_baseUrl&position=$lat,$long';

    try {
      var response = await http.get(_url);
      final _mapResponse = mapResponseFromJson(response.body);

      return _mapResponse;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (exc) {
      _serviceLogger.severe(exc.toString());
    }

    return <MapResponse>[];
  }
}

class UrlChecker {
  UrlChecker._();

  static dynamic checkResponse(http.Response resp) => _checkResponse(resp);
}

dynamic _checkResponse(http.Response resp) {
  final _body = resp.body;

  switch (resp.statusCode) {
    case 200:
      var _resp = _body;
      return _resp;

    case 400:
      throw BadRequestException(_body);

    case 401:
    case 403:
      throw UnauthorisedException(_body);

    default:
      throw FetchDataException(
        'Error occured while Communication with Server with StatusCode : ${resp.statusCode}',
      );
  }
}
