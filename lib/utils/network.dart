import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:message_app/utils/exceptions.dart';

abstract class Network {
  Future<dynamic> get(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  });
}

class NetworkImplementation extends Network {
  Map<String, String> createHeaders(Map<String, dynamic> incomingHeaders) {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      ...incomingHeaders,
    };
  }

  dynamic handleResponse(http.Response response) {
    Logger().d(response.statusCode);
    Logger().d(response.body);
    if (!isSuccessResponse(response.statusCode)) {
      var decodedResponse = json.decode(response.body);
      throw CustomException(
        message: decodedResponse["message"] ?? decodedResponse["Message"],
        statusCode: response.statusCode,
      );
    } else {
      return json.decode(response.body);
    }
  }

  dynamic handleFormResponse(http.StreamedResponse response) async {
    Logger().d(response.statusCode);
    Logger().d(response.stream.bytesToString());
    if (!isSuccessResponse(response.statusCode)) {
      var data = await response.stream.bytesToString();
      var decodedResponse = json.decode(data);
      throw CustomException(
        message: decodedResponse["message"] ?? decodedResponse["Message"],
        statusCode: response.statusCode,
      );
    } else {
      var data = await response.stream.bytesToString();
      return json.decode(data);
    }
  }

  bool isSuccessResponse(int number) => number >= 200 && number <= 299;

  @override
  Future get(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    Logger().d(route);

    try {
      http.Response response = await http.get(
        Uri.parse(route),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    }
  }
}
