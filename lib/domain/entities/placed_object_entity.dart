import 'package:equatable/equatable.dart';
import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:room_decorator/domain/entities/transformation_entity.dart';

class PlacedObject extends Equatable {
  final String instanceId; // Unique ID for this specific instance in the scene
  final CatalogItem catalogItem;
  final Transformation transform;

  const PlacedObject({
    required this.instanceId,
    required this.catalogItem,
    required this.transform,
  });

  PlacedObject copyWith({
    String? instanceId,
    CatalogItem? catalogItem,
    Transformation? transform,
  }) {
    return PlacedObject(
      instanceId: instanceId ?? this.instanceId,
      catalogItem: catalogItem ?? this.catalogItem,
      transform: transform ?? this.transform,
    );
  }

  @override
  List<Object?> get props => [instanceId, catalogItem, transform];
}