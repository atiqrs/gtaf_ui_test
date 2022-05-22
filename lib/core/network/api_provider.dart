import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'api_execption.dart';

class ApiProvider {
  Future<dynamic> getWithoutBearer(String url) async {
    final finalUrl = Uri.parse(url);

    var responseJson;
    try {
      final response = await http.get((finalUrl), headers: <String, String>{
        "Accept": "application/json",
        "Content-type": "application/json",
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.reasonPhrase}');
    }
  }
}
