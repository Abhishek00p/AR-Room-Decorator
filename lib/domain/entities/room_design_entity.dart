import 'package:equatable/equatable.dart';
import 'package:room_decorator/domain/entities/placed_object_entity.dart';
import 'package:room_decorator/domain/entities/wall_paint_entity.dart';

class RoomDesign extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<PlacedObject> placedObjects;
  final List<WallPaint> wallPaints;

  const RoomDesign({
    required this.id,
    required this.name,
    required this.createdAt,
    this.placedObjects = const [],
    this.wallPaints = const [],
  });

  RoomDesign copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    List<PlacedObject>? placedObjects,
    List<WallPaint>? wallPaints,
  }) {
    return RoomDesign(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      placedObjects: placedObjects ?? this.placedObjects,
      wallPaints: wallPaints ?? this.wallPaints,
    );
  }

  @override
  List<Object?> get props => [id, name, createdAt, placedObjects, wallPaints];
}