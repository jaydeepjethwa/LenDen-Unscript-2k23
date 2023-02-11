import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:unscript/service/app_exception.dart';

class BaseClient {
  //Get
  Future<dynamic> getRequest(String url) async {
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", url);
    } on TimeoutException {
      throw ApiNotrespondingException("API not responding in time", url);
    }
  }

  //Get
  Future<dynamic> getRequestWithHeader(String url, dynamic header) async {
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", url);
    } on TimeoutException {
      throw ApiNotrespondingException("API not responding in time", url);
    }
  }

  // Post
  Future<dynamic> postRequest(
      String url, dynamic payload, dynamic header) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: payload,
            headers: header,
          )
          .timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", url);
    } on TimeoutException {
      throw ApiNotrespondingException("API not responding in time", url);
    }
  }

  //Post
  Future<dynamic> postRequestWithoutHeader(
      String url, dynamic payload) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: payload,
          )
          .timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", url);
    } on TimeoutException {
      throw ApiNotrespondingException("API not responding in time", url);
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print("hhello");
        return json.decode(response.body);
      case 201:
        return json.decode(response.body);
      case 202:
        throw BadRequestException(json.decode(response.body)["message"],
            response.request?.url.toString() ?? "");
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes),
            response.request?.url.toString() ?? "");
      case 500:
        throw UnauthorizedException(
            "Check you credentials", response.request?.url.toString() ?? "");
      default:
        throw FetchDataException(
            "Error occured with code : ${response.statusCode}",
            response.request?.url.toString() ?? "");
    }
  }
}
