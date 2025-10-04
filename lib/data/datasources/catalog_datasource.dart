import 'package:room_decorator/data/models/catalog_item_model.dart';
import 'package:room_decorator/data/models/paint_color_model.dart';

abstract class CatalogDataSource {
  Future<List<CatalogItemModel>> getCatalogItems();
  Future<List<PaintColorModel>> getPaintColors();
}