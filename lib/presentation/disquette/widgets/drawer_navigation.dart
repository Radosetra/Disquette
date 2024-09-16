import 'package:flutter/material.dart';
import 'package:togo/domain/entities/Disquette.dart';
import 'package:togo/utils/api.dart';

class DrawerNavigation extends StatelessWidget {
  // should fetch the data from here
  DrawerNavigation({super.key, required this.label, required this.icon, required this.mycolor, required this.onCategorySelected});
  String label;

  String icon;

  Color mycolor;

  final Function(String) onCategorySelected;

  void onChange(String endpoint){
    onCategorySelected(endpoint);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        String endpoint = Api().baseUrl + "/category/$label";
        onChange(endpoint);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: mycolor
        ),
        child: ListTile(
          title: Text(label),
          leading: Text(
            icon,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}