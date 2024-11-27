import 'package:dartz/dartz.dart';
import '../cat.dart';

abstract class GetCats {
  Future<Either<Exception, List<Cat>>> execute();
}
