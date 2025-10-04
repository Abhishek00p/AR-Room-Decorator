import 'package:equatable/equatable.dart';
import 'package:vector_math/vector_math_64.dart';

enum ARPlaneType {
  horizontal,
  vertical,
}

class ARPlane extends Equatable {
  final String planeId;
  final ARPlaneType type;
  final Vector3 center;
  // In a real app, you might also include the plane's extent or boundary points.
  // For now, center is sufficient for our logic.

  const ARPlane({
    required this.planeId,
    required this.type,
    required this.center,
  });

  @override
  List<Object?> get props => [planeId, type, center];
}