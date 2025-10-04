import 'package:room_decorator/data/models/placed_object_model.dart';
import 'package:room_decorator/data/models/wall_paint_model.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';

class RoomDesignModel extends RoomDesign {
  const RoomDesignModel({
    required String id,
    required String name,
    required DateTime createdAt,
    List<PlacedObjectModel> placedObjects = const [],
    List<WallPaintModel> wallPaints = const [],
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          placedObjects: placedObjects,
          wallPaints: wallPaints,
        );

  @override
  List<PlacedObjectModel> get placedObjects =>
      super.placedObjects.map((e) => e as PlacedObjectModel).toList();

  @override
  List<WallPaintModel> get wallPaints =>
      super.wallPaints.map((e) => e as WallPaintModel).toList();

  factory RoomDesignModel.fromJson(Map<String, dynamic> json) {
    return RoomDesignModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      placedObjects: (json['placedObjects'] as List)
          .map((item) => PlacedObjectModel.fromJson(item))
          .toList(),
      wallPaints: (json['wallPaints'] as List)
          .map((item) => WallPaintModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'placedObjects': placedObjects.map((item) => item.toJson()).toList(),
      'wallPaints': wallPaints.map((item) => item.toJson()).toList(),
    };
  }

  factory RoomDesignModel.fromEntity(RoomDesign entity) {
    if (entity is RoomDesignModel) {
      return entity;
    }
    return RoomDesignModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      placedObjects: entity.placedObjects
          .map((item) => PlacedObjectModel.fromEntity(item))
          .toList(),
      wallPaints: entity.wallPaints
          .map((item) => WallPaintModel.fromEntity(item))
          .toList(),
    );
  }
}