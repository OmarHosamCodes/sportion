import 'dart:async';

import 'package:sportion/library.dart';
import 'package:http/http.dart' as http;

class SportsRepository {
  static final instance = SportsRepository();

  Future<List<String>> fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('categories') != null) {
      return prefs.getStringList('categories')!;
    } else {
      final apiKey = dotenv.get('API_RAPID_KEY');
      final host = dotenv.get('API_RAPID_HOST');

      final url =
          Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPartList');
      final headers = {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': host,
      };

      final response = await http.get(url, headers: headers);

      final categories = response.body
          .replaceAll('"', '')
          .replaceFirst('[', '')
          .replaceFirst(']', '')
          .split(',');
      if (response.statusCode == 200) {
        prefs.setStringList('categories', categories);
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    }
  }

  Future<List<Exercise>> fetchExercises(String category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('categories_$category') != null) {
      return prefs
          .getStringList('categories_$category')!
          .map((e) => Exercise.fromMap(json.decode(e)))
          .toList();
    } else {
      final apiKey = dotenv.get('API_RAPID_KEY');
      final host = dotenv.get('API_RAPID_HOST');

      final url = Uri.parse(
          'https://exercisedb.p.rapidapi.com/exercises/bodyPart/$category');
      final headers = {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': host,
      };

      final response = await http.get(url, headers: headers);
      response.body.log();

      if (response.statusCode == 200) {
        final List<dynamic> body = json.decode(response.body);
        prefs.setStringList(
            'categories_$category', body.map((e) => json.encode(e)).toList());
        return body.map((e) => Exercise.fromMap(e)).toList();
      } else {
        throw Exception('Failed to load exercises');
      }
    }
  }
}
