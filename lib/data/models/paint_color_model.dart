import 'package:flutter/material.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';

class PaintColorModel extends PaintColor {
  const PaintColorModel({
    required String id,
    required String name,
    required Color color,
    required PaintTexture texture,
  }) : super(id: id, name: name, color: color, texture: texture);

  factory PaintColorModel.fromJson(Map<String, dynamic> json) {
    return PaintColorModel(
      id: json['id'],
      name: json['name'],
      color: Color(json['color']),
      texture: PaintTexture.values.firstWhere((e) => e.toString() == json['texture']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color.value,
      'texture': texture.toString(),
    };
  }

  factory PaintColorModel.fromEntity(PaintColor entity) {
    if (entity is PaintColorModel) {
      return entity;
    }
    return PaintColorModel(
      id: entity.id,
      name: entity.name,
      color: entity.color,
      texture: entity.texture,
    );
  }
}