import 'package:flutter/material.dart';
import 'package:togo/data/repositories/disquette_repository.dart';
import 'package:togo/presentation/disquette/widgets/drawer_navigation.dart';
import 'package:togo/utils/data.dart';

class DisquetteDrawer extends StatelessWidget {
  DisquetteDrawer({super.key, required this.onCategorySelected});

  final Function(String) onCategorySelected;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Container(
          
          child: 
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Disquette",
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                  IconButton(
                    icon: Icon(Icons.close_sharp),
                    onPressed: (){
                      //
                      print("Close drawer");
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(height: 5,),
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        DrawerNavigation(
                          label: categories[index].label,
                          mycolor: categories[index].color,
                          icon: categories[index].icon,
                          onCategorySelected: onCategorySelected,
                        ),

                        const SizedBox(height: 10,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}