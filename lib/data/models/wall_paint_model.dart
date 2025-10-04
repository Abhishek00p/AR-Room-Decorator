import 'package:room_decorator/data/models/paint_color_model.dart';
import 'package:room_decorator/domain/entities/wall_paint_entity.dart';

class WallPaintModel extends WallPaint {
  const WallPaintModel({
    required String wallPlaneId,
    required PaintColorModel paint,
  }) : super(wallPlaneId: wallPlaneId, paint: paint);

  @override
  PaintColorModel get paint => super.paint as PaintColorModel;

  factory WallPaintModel.fromJson(Map<String, dynamic> json) {
    return WallPaintModel(
      wallPlaneId: json['wallPlaneId'],
      paint: PaintColorModel.fromJson(json['paint']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wallPlaneId': wallPlaneId,
      'paint': paint.toJson(),
    };
  }

  factory WallPaintModel.fromEntity(WallPaint entity) {
    if (entity is WallPaintModel) {
      return entity;
    }
    return WallPaintModel(
      wallPlaneId: entity.wallPlaneId,
      paint: PaintColorModel.fromEntity(entity.paint),
    );
  }
}