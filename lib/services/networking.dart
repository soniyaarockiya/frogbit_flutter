import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Networking {
  Future<dynamic> getResponse(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}
