import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';

abstract class CatalogRepository {
  Future<Either<Failure, List<CatalogItem>>> getCatalogItems();
  Future<Either<Failure, List<PaintColor>>> getPaintColors();
}