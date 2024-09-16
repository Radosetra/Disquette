// use for serialisation and deserialisation
import 'package:togo/domain/entities/Disquette.dart';

class DisquetteModel extends Disquette {
  DisquetteModel({
    required String id,
    required String text
  }) : super(id: id, text: text);

  // convert json to Disquette Model
  factory DisquetteModel.fromJson(Map<String, dynamic> json) {
    return DisquetteModel(
      id: json["_id"], 
      text: json["text"]);
  }
}