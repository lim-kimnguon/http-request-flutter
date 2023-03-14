
import '../models/user.dart';
import 'package:http/http.dart' as http;

class ApiService 
{
  Future<List<User>?> getUsers() async {
    
    var client = http.Client();

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var response = await client.get(url); // also the headers if needed

    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json); 
    }
  

  }
}