
import 'package:flutter/material.dart';
import 'package:togo/domain/entities/category.dart';
import 'package:togo/utils/app_color.dart';

List<Category> categories = [
  Category(label: "Romantic", color: AppColor().red, icon: "❤️" ),
  Category(label: "Funnies", color: Colors.green, icon: "😄" ),
  Category(label: "Cheesy", color: AppColor().yellow, icon: "🧀" ),
  Category(label: "Flirty", color: AppColor().purple, icon: "😏" ),
  Category(label: "Clever", color: AppColor().blue, icon: "😎" ),

];