import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final bool IsSuccess;
  final Map<String, dynamic>? ResponseBody;
  final String? erroeMessage;

  NetworkResponse({
    required this.statusCode,
    required this.IsSuccess,
    this.ResponseBody,
    this.erroeMessage = "something went wrong",
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> PostReqest({
    required String url,
    required Map<String, dynamic> RequestBody,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'token': ' ',
      };
      requestLog(url: url, header: header, ReqestBody: RequestBody);
      Response response = await post(
        uri,
        body: jsonEncode(RequestBody),
        headers: header,
      );
      responseLog(url: url, response: response);
      final ResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: true,
          ResponseBody: ResponseBody,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
          erroeMessage: ResponseBody['msg'],
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
          erroeMessage: ResponseBody['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        IsSuccess: false,
        erroeMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> GetReqest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'token': ' ',
      };
      requestLog(url: url, header: header);
      Response response = await get(uri, headers: header);
      responseLog(url: url, response: response);
      if (response.statusCode == 200) {
        final ResponseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: true,
          ResponseBody: ResponseBody,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        IsSuccess: false,
        erroeMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> DeleteReqest({
    required String url,
    required Map<String, dynamic> RequestBody,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'token': ' ',
      };
      requestLog(url: url, header: header, ReqestBody: RequestBody);
      Response response = await delete(
        uri,
        body: jsonEncode(RequestBody),
        headers: header,
      );
      responseLog(url: url, response: response);
      if (response.statusCode == 200) {
        final ResponseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: true,
          ResponseBody: ResponseBody,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        IsSuccess: false,
        erroeMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> PutReqest({
    required String url,
    required Map<String, dynamic> RequestBody,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'token': ' ',
      };
      requestLog(url: url, header: header, ReqestBody: RequestBody);
      Response response = await put(
        uri,
        body: jsonEncode(RequestBody),
        headers: header,
      );
      responseLog(url: url, response: response);
      if (response.statusCode == 200) {
        final ResponseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: true,
          ResponseBody: ResponseBody,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        IsSuccess: false,
        erroeMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> PatchReqest({
    required String url,
    required Map<String, dynamic> RequestBody,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'token': ' ',
      };
      requestLog(url: url, header: header, ReqestBody: RequestBody);
      Response response = await patch(
        uri,
        body: jsonEncode(RequestBody),
        headers: header,
      );
      responseLog(url: url, response: response);
      if (response.statusCode == 200) {
        final ResponseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: true,
          ResponseBody: ResponseBody,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          IsSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        IsSuccess: false,
        erroeMessage: e.toString(),
      );
    }
  }

  requestLog({
    required String url,
    required Map<String, dynamic> header,
    Map<String, dynamic>? ReqestBody,
  }) {

    _logger.i("url=> $url\nheader=> $header\nReqBody=> $ReqestBody");
  }

  responseLog({required String url, required Response response}) {
    _logger.i(
      "url=> $url\nstatusCode=>${response.statusCode}\nresponseBody=>${response.body}",
    );
  }
}
