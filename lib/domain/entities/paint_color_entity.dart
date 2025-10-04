import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum PaintTexture {
  matte,
  glossy,
  textured,
}

class PaintColor extends Equatable {
  final String id;
  final String name;
  final Color color;
  final PaintTexture texture;

  const PaintColor({
    required this.id,
    required this.name,
    required this.color,
    required this.texture,
  });

  @override
  List<Object?> get props => [id, name, color, texture];
}