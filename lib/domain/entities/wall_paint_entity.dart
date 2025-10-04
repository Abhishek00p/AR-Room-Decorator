import 'package:equatable/equatable.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';

class WallPaint extends Equatable {
  final String wallPlaneId; // Corresponds to the ID of the detected AR plane
  final PaintColor paint;

  const WallPaint({
    required this.wallPlaneId,
    required this.paint,
  });

  @override
  List<Object?> get props => [wallPlaneId, paint];
}