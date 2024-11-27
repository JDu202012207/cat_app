import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cat_dto.dart';
import '../../../../../../core/app_constans.dart';
class CatService {
  final http.Client client;

  CatService({required this.client});

  Future<List<CatDto>> fetchCats() async {
    final Uri url = Uri.parse(AppConstants.breedsEndpoint);

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CatDto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch cats. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching cats: $e');
    }
  }
}
