import 'package:munich/data/models/network/movies_response/movies_response.dart';
import 'package:munich/data/network/network_client/network_client.dart';
import 'package:munich/domain/models/movies.dart';
import 'package:munich/domain/services/search/search_service.dart';
import 'package:munich/locator/locator.dart';

class SearchServiceImpl implements SearchService {
  final _networkClient = locator<NetworkClient>();

  @override
  Future<Movies> searchMovies({required String query}) async {
    final response = await _networkClient.searchMovies(query);
    return response.toMovies();
  }
}
