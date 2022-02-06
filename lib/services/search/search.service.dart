import 'package:starter_kit/models/data_search/data_search.dart';
import 'package:starter_kit/repositories/search/search.repository.dart';
import 'package:starter_kit/utils/exception.dart';

class SearchService {
  Future<DataSearch> search(String  word) async {
    final response = await SearchRepository.search(word);
    return (response.statusCode == 200)
        ? DataSearch.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException(message: Map<String, dynamic>.from(response.data as Map));
  }
}
