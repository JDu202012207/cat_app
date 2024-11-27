import 'package:dartz/dartz.dart';
import '../../domain/cat.dart';
import '../remote/cat_service.dart';

class CatRepository {
  final CatService service;

  CatRepository(this.service);

  /// Obtiene la lista de gatos, ya sea de la API o de otra fuente de datos
  Future<Either<Exception, List<Cat>>> getCats() async {
    try {
      final dtoList = await service.fetchCats();
      final cats = dtoList.map((dto) => dto.toDomain()).toList();
      return Right(cats);
    } catch (e) {
      return Left(Exception('Failed to fetch cats: $e'));
    }
  }
}
