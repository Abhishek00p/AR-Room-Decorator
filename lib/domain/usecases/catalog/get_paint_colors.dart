import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';
import 'package:room_decorator/domain/repositories/catalog_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class GetPaintColors implements UseCase<List<PaintColor>, NoParams> {
  final CatalogRepository repository;

  GetPaintColors(this.repository);

  @override
  Future<Either<Failure, List<PaintColor>>> call(NoParams params) async {
    return await repository.getPaintColors();
  }
}