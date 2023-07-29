import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  postRequest({
    required String route,
    required Map<String, String> data,
  }) async {
    String apiUrl = 'http://127.0.0.1:8000/api';
    String url = apiUrl + route;
     return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
    );

  }
  

  _header() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}