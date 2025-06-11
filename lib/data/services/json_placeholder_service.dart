import 'dart:convert';
import 'package:http/http.dart' as http;

class JsonPlaceholderService {
  final http.Client client;

  JsonPlaceholderService(this.client);

  Future<List<dynamic>> fetchData() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // e.g., list of posts
    } else {
      throw Exception('Failed to load data');
    }
  }
}