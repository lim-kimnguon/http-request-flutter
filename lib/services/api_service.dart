
import 'dart:convert';

import 'package:http_request/constant/constant.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class ApiService 
{
  Future<List<User>?> getUsers() async {
    
    var client = http.Client();

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);

    var response = await client.get(url); // also the headers if needed

    if (response.statusCode == 200) {
     var json = jsonDecode(response.body)["data"];
        print(jsonEncode(json));
      return userFromJson(jsonEncode(json)); 
    }
  // var json = jsonDecode(response.body)["data"];
  //   print(json);

  }
}