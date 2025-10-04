import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:room_decorator/domain/repositories/catalog_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class GetCatalogItems implements UseCase<List<CatalogItem>, NoParams> {
  final CatalogRepository repository;

  GetCatalogItems(this.repository);

  @override
  Future<Either<Failure, List<CatalogItem>>> call(NoParams params) async {
    return await repository.getCatalogItems();
  }
}