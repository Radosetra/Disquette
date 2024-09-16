import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:togo/data/model/disquette_model.dart';
import 'package:togo/utils/api.dart';

class DisquetteService {
  final http.Client client;
  final Api api = Api();

  DisquetteService({required this.client});

  // fetch some disquette
  Future<List<DisquetteModel>> fetchDisquette() async {
    final response = await client.get(Uri.parse('${api.baseUrl}/list?page=1&perPage=8'));

    if(response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      print('Data fetched');

      return jsonList.map((json) => DisquetteModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load data from api call");
    }
  }

  Future<List<DisquetteModel>> fetchDisquetteByCategory(String endpoint) async {
    Uri url = Uri.parse('${endpoint}?page=1&perPage=8');
    print("Url : $url");
    final response = await client.get(url);

    if(response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      print('Data fetched');

      return jsonList.map((json) => DisquetteModel.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      throw Exception("Failed to load data from api call");
    }
  }
}