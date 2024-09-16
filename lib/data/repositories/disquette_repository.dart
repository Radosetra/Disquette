import 'package:togo/data/services/disquette_service.dart';
import 'package:togo/domain/entities/disquette.dart';

class DisquetteRepository {
  final DisquetteService disquetteService;

  DisquetteRepository(this.disquetteService);

  Future<List<Disquette>> getDisquette() async{
    final disquetteModel = await disquetteService.fetchDisquette();
    return disquetteModel.map((disquette) => Disquette(
      id: disquette.id, 
      text: disquette.text)).toList();
  }
  Future<List<Disquette>> getDisquetteByCategory(String endpoint) async{
    final disquetteModel = await disquetteService.fetchDisquetteByCategory(endpoint);
    return disquetteModel.map((disquette) => Disquette(
      id: disquette.id, 
      text: disquette.text)).toList();
  }
}