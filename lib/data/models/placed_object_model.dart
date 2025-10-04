import 'package:room_decorator/data/models/catalog_item_model.dart';
import 'package:room_decorator/data/models/transformation_model.dart';
import 'package:room_decorator/domain/entities/placed_object_entity.dart';

class PlacedObjectModel extends PlacedObject {
  const PlacedObjectModel({
    required String instanceId,
    required CatalogItemModel catalogItem,
    required TransformationModel transform,
  }) : super(
          instanceId: instanceId,
          catalogItem: catalogItem,
          transform: transform,
        );

  @override
  CatalogItemModel get catalogItem => super.catalogItem as CatalogItemModel;

  @override
  TransformationModel get transform => super.transform as TransformationModel;

  factory PlacedObjectModel.fromJson(Map<String, dynamic> json) {
    return PlacedObjectModel(
      instanceId: json['instanceId'],
      catalogItem: CatalogItemModel.fromJson(json['catalogItem']),
      transform: TransformationModel.fromJson(json['transform']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'catalogItem': catalogItem.toJson(),
      'transform': transform.toJson(),
    };
  }

  factory PlacedObjectModel.fromEntity(PlacedObject entity) {
    if (entity is PlacedObjectModel) {
      return entity;
    }
    return PlacedObjectModel(
      instanceId: entity.instanceId,
      catalogItem: CatalogItemModel.fromEntity(entity.catalogItem),
      transform: TransformationModel.fromEntity(entity.transform),
    );
  }
}