import 'package:room_decorator/domain/entities/transformation_entity.dart';
import 'package:vector_math/vector_math_64.dart';

class TransformationModel extends Transformation {
  const TransformationModel({
    required Vector3 position,
    required Vector4 rotation,
    required Vector3 scale,
  }) : super(position: position, rotation: rotation, scale: scale);

  factory TransformationModel.fromJson(Map<String, dynamic> json) {
    return TransformationModel(
      position: Vector3.array((json['position'] as List).map((e) => (e as num).toDouble()).toList()),
      rotation: Vector4.array((json['rotation'] as List).map((e) => (e as num).toDouble()).toList()),
      scale: Vector3.array((json['scale'] as List).map((e) => (e as num).toDouble()).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position.storage.toList(),
      'rotation': rotation.storage.toList(),
      'scale': scale.storage.toList(),
    };
  }

  factory TransformationModel.fromEntity(Transformation entity) {
    if (entity is TransformationModel) {
      return entity;
    }
    return TransformationModel(
      position: entity.position,
      rotation: entity.rotation,
      scale: entity.scale,
    );
  }
}