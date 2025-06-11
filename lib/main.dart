import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:togo/data/repositories/disquette_repository.dart';
// import 'package:togo/data/services/disquette_service.dart';
// import 'package:togo/presentation/disquette/screens/disquette_screen.dart';
// import 'package:http/http.dart' as http;

// import 'package:get_it/get_it.dart';
import 'package:togo/presentation/disquette/screens/home_screen.dart';
import 'package:togo/presentation/disquette/screens/landing_screen.dart';

// final getIt = GetIt.instance;

// void setupLocator(){
//   getIt.registerLazySingleton(() => http.Client());
//   getIt.registerLazySingleton(() => DisquetteService(client: getIt()));
//   getIt.registerLazySingleton(() => DisquetteRepository(getIt()));

// }

void main() {
  // setupLocator();
  // Riverpod config
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: DisquetteScreen(title: 'Disquette'),
      // home: const HomeScreen(),
      home: const LandingScreen(),
    );
  }
}


