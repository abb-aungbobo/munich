import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:munich/data/configuration/environment.dart';
import 'package:munich/data/database/database_client.dart';
import 'package:munich/data/network/network_client/network_client.dart';
import 'package:munich/data/services/favorite/favorite_service_impl.dart';
import 'package:munich/data/services/movie/movie_service_impl.dart';
import 'package:munich/data/services/search/search_service_impl.dart';
import 'package:munich/domain/services/favorite/favorite_service.dart';
import 'package:munich/domain/services/movie/movie_service.dart';
import 'package:munich/domain/services/search/search_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  _registerNetworkClient();
  _registerDatabaseClient();
  _registerServices();
}

void _registerNetworkClient() {
  final Dio dio = Dio();
  dio.options.queryParameters = {"api_key": Environment.apiKey};
  locator.registerLazySingleton<NetworkClient>(() => NetworkClient(dio));
}

void _registerDatabaseClient() {
  locator.registerLazySingleton<DatabaseClient>(() => DatabaseClient());
}

void _registerServices() {
  locator.registerFactory<MovieService>(() => MovieServiceImpl());
  locator.registerFactory<FavoriteService>(() => FavoriteServiceImpl());
  locator.registerFactory<SearchService>(() => SearchServiceImpl());
}
