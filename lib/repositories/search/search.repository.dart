import 'package:starter_kit/config/application.dart';

class SearchRepository {
  static Future<dynamic> search(String word) {
    return Application.api.get('/search/repositories?q=$word');
  }
}
