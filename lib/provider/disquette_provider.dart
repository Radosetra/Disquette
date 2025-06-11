import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:togo/data/services/json_placeholder_service.dart';

// Give acces to a method globally
// use for reading the state of the provider
// use Provider to access a repository, a logger, or some other class that doesn't contain mutable state.
final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world';
});

// Pass argument to a provider
// final movieProvider = FutureProvider.autoDispose
//     // additional movieId argument of type int
//     .family<TMDBMovieBasic, int>((ref, movieId) async {
//   // get the repository
//   final moviesRepo = ref.watch(fetchMoviesRepositoryProvider);
//   // call method that returns a Future<TMDBMovieBasic>, passing the movieId as an argument
//   return moviesRepo.movie(movieId: movieId, cancelToken: cancelToken);
// });

// final movieAsync = ref.watch(movieProvider(550));

// Register a unique singleton httpClient
final httpClientProvider = Provider<http.Client>((ref){
  return http.Client();
});

final jsonPlaceholderServiceProvider = Provider<JsonPlaceholderService>((ref) {
  final client = ref.watch(httpClientProvider);
  return JsonPlaceholderService(client);
});

final postListProvider = FutureProvider<List<dynamic>>((ref){
  return ref.watch(jsonPlaceholderServiceProvider).fetchData();
});