import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:vector_math/vector_math_64.dart';

class CatalogItemModel extends CatalogItem {
  const CatalogItemModel({
    required String id,
    required String name,
    required ItemCategory category,
    required String modelPath,
    required Vector3 dimensions,
    String? thumbnailPath,
  }) : super(
          id: id,
          name: name,
          category: category,
          modelPath: modelPath,
          dimensions: dimensions,
          thumbnailPath: thumbnailPath,
        );

  factory CatalogItemModel.fromJson(Map<String, dynamic> json) {
    return CatalogItemModel(
      id: json['id'],
      name: json['name'],
      category: ItemCategory.values.firstWhere((e) => e.toString() == json['category']),
      modelPath: json['modelPath'],
      dimensions: Vector3.array((json['dimensions'] as List).map((e) => (e as num).toDouble()).toList()),
      thumbnailPath: json['thumbnailPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.toString(),
      'modelPath': modelPath,
      'dimensions': dimensions.storage.toList(),
      'thumbnailPath': thumbnailPath,
    };
  }

  factory CatalogItemModel.fromEntity(CatalogItem entity) {
    if (entity is CatalogItemModel) {
      return entity;
    }
    return CatalogItemModel(
      id: entity.id,
      name: entity.name,
      category: entity.category,
      modelPath: entity.modelPath,
      dimensions: entity.dimensions,
      thumbnailPath: entity.thumbnailPath,
    );
  }
}