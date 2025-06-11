import 'package:flutter/material.dart';
import 'package:togo/data/repositories/disquette_repository.dart';
import 'package:togo/domain/entities/disquette.dart';
import 'package:togo/presentation/disquette/widgets/card_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:togo/presentation/disquette/widgets/disquette_appbar.dart';
import 'package:togo/presentation/disquette/widgets/drawer.dart';

class DisquetteScreen extends StatefulWidget {
  const DisquetteScreen({super.key, required this.title});

  final String title;

  @override
  State<DisquetteScreen> createState() => _DisquetteScreenState();
}

class _DisquetteScreenState extends State<DisquetteScreen> {
  DisquetteRepository? disquetteRepository;

  late Future<List<Disquette>> disquetteFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the repository in initState
    disquetteRepository = GetIt.instance<DisquetteRepository>();
     // Initialize with a fallback Future immediately
    
    // Then update it after fetching actual data
    if (disquetteRepository != null) {
      disquetteFuture = disquetteRepository!.getDisquette();
    }
  }

  void setDisquetteFutur(String endpoint){
    Future<List<Disquette>> disquettes = disquetteRepository!.getDisquetteByCategory(endpoint);
    setState(() {
      disquetteFuture = disquettes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DisquetteAppBar(title: "Home"),
        drawer: Drawer(
          child: DisquetteDrawer(
            onCategorySelected: setDisquetteFutur,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 234, 234),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: 
                  disquetteRepository == null ?
                  const Center(child: CircularProgressIndicator())
                  : FutureBuilder<List<Disquette>>(
                    future: disquetteFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No users found');
                      }
                      final disquette = snapshot.data!;
                      return ListView.builder(
                          itemCount: disquette.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CardWidget(text: disquette[index].text,),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          });
                    })),
          ),
        ));
  }
}
