import 'package:flutter/material.dart';

class Category{
  String label;

  Color color;

  String icon;

  Category({
    required this.label,
    required this.color,
    required this.icon
  });

  String getUrl(){
    return "/category/:$label";
  }
}