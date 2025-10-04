import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/exceptions.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/data/datasources/catalog_datasource.dart';
import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';
import 'package:room_decorator/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogDataSource dataSource;

  CatalogRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CatalogItem>>> getCatalogItems() async {
    try {
      final items = await dataSource.getCatalogItems();
      return Right(items);
    } on ServerException catch (e) {
      return Left(CatalogLoadFailure('Failed to load catalog from server: ${e.message}'));
    } catch (e) {
      return Left(CatalogLoadFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PaintColor>>> getPaintColors() async {
    try {
      final colors = await dataSource.getPaintColors();
      return Right(colors);
    } on ServerException catch (e) {
      return Left(CatalogLoadFailure('Failed to load paint colors from server: ${e.message}'));
    } catch (e) {
      return Left(CatalogLoadFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}