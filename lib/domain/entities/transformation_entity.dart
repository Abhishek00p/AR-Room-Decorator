import 'package:equatable/equatable.dart';
import 'package:vector_math/vector_math_64.dart';

class Transformation extends Equatable {
  final Vector3 position;
  final Vector4 rotation;
  final Vector3 scale;

  const Transformation({
    required this.position,
    required this.rotation,
    required this.scale,
  });

  factory Transformation.initial() => Transformation(
        position: Vector3.zero(),
        rotation: Vector4.identity(),
        scale: Vector3.all(1.0),
      );

  Transformation copyWith({
    Vector3? position,
    Vector4? rotation,
    Vector3? scale,
  }) {
    return Transformation(
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      scale: scale ?? this.scale,
    );
  }

  @override
  List<Object?> get props => [position, rotation, scale];
}