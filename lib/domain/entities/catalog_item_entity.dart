import 'package:equatable/equatable.dart';
import 'package:vector_math/vector_math_64.dart';

enum ItemCategory {
  furniture,
  decor,
  lighting,
  plants,
  rugs,
}

class CatalogItem extends Equatable {
  final String id;
  final String name;
  final ItemCategory category;
  final String modelPath; // Path to the 3D model file
  final Vector3 dimensions; // Real-world dimensions in meters (width, height, depth)
  final String? thumbnailPath;

  const CatalogItem({
    required this.id,
    required this.name,
    required this.category,
    required this.modelPath,
    required this.dimensions,
    this.thumbnailPath,
  });

  @override
  List<Object?> get props => [id, name, category, modelPath, dimensions, thumbnailPath];
}