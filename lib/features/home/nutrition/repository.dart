import 'package:http/http.dart' as http;
import 'package:sportion/library.dart';

class NutritionRepository {
  static Future<List> getNutritionList(query) async {
    final apiKey = dotenv.get('API_NINJA_KEY');

    final url =
        Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$query');
    final headers = {'X-Api-Key': apiKey};

    final response = await http.get(url, headers: headers);
    String nutrition;

    if (response.statusCode == 200) {
      nutrition = response.body.toString();
    } else {
      throw Exception('Failed to load nutrition list');
    }

    final nutritionList = jsonDecode(nutrition) as List;

    return nutritionList;
  }
}
