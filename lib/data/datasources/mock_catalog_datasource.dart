import 'package:flutter/material.dart';
import 'package:room_decorator/data/datasources/catalog_datasource.dart';
import 'package:room_decorator/data/models/catalog_item_model.dart';
import 'package:room_decorator/data/models/paint_color_model.dart';
import 'package:room_decorator/domain/entities/catalog_item_entity.dart';
import 'package:room_decorator/domain/entities/paint_color_entity.dart';
import 'package:vector_math/vector_math_64.dart';

class MockCatalogDataSource implements CatalogDataSource {
  @override
  Future<List<CatalogItemModel>> getCatalogItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockFurnitureItems + _mockDecorItems;
  }

  @override
  Future<List<PaintColorModel>> getPaintColors() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockPaintColors;
  }

  final List<CatalogItemModel> _mockFurnitureItems = [
    // Sofas
    CatalogItemModel(id: 'sofa_01', name: 'Modern Gray Sofa', category: ItemCategory.furniture, modelPath: 'models/sofa_01.glb', dimensions: Vector3(2.2, 0.9, 1.0)),
    CatalogItemModel(id: 'sofa_02', name: 'Leather Chesterfield', category: ItemCategory.furniture, modelPath: 'models/sofa_02.glb', dimensions: Vector3(2.0, 0.8, 0.95)),
    // Tables
    CatalogItemModel(id: 'table_01', name: 'Oak Coffee Table', category: ItemCategory.furniture, modelPath: 'models/table_01.glb', dimensions: Vector3(1.2, 0.4, 0.6)),
    CatalogItemModel(id: 'table_02', name: 'Glass Dining Table', category: ItemCategory.furniture, modelPath: 'models/table_02.glb', dimensions: Vector3(1.8, 0.75, 0.9)),
    // Chairs
    CatalogItemModel(id: 'chair_01', name: 'Eames Lounge Chair', category: ItemCategory.furniture, modelPath: 'models/chair_01.glb', dimensions: Vector3(0.85, 0.85, 0.8)),
    CatalogItemModel(id: 'chair_02', name: 'Wooden Dining Chair', category: ItemCategory.furniture, modelPath: 'models/chair_02.glb', dimensions: Vector3(0.45, 0.9, 0.5)),
    // Beds
    CatalogItemModel(id: 'bed_01', name: 'Queen Size Bed Frame', category: ItemCategory.furniture, modelPath: 'models/bed_01.glb', dimensions: Vector3(1.6, 1.0, 2.1)),
    // Cabinets
    CatalogItemModel(id: 'cabinet_01', name: 'Tall Bookcase', category: ItemCategory.furniture, modelPath: 'models/cabinet_01.glb', dimensions: Vector3(0.8, 2.0, 0.3)),
    CatalogItemModel(id: 'cabinet_02', name: 'TV Stand', category: ItemCategory.furniture, modelPath: 'models/cabinet_02.glb', dimensions: Vector3(1.8, 0.5, 0.4)),
    CatalogItemModel(id: 'furniture_10', name: 'Modern Armchair', category: ItemCategory.furniture, modelPath: 'models/armchair.glb', dimensions: Vector3(0.9, 1.0, 0.85)),
  ];

  final List<CatalogItemModel> _mockDecorItems = [
    // Vases
    CatalogItemModel(id: 'vase_01', name: 'Ceramic Vase', category: ItemCategory.decor, modelPath: 'models/vase_01.glb', dimensions: Vector3(0.2, 0.4, 0.2)),
    // Lamps
    CatalogItemModel(id: 'lamp_01', name: 'Floor Lamp', category: ItemCategory.lighting, modelPath: 'models/lamp_01.glb', dimensions: Vector3(0.3, 1.6, 0.3)),
    CatalogItemModel(id: 'lamp_02', name: 'Desk Lamp', category: ItemCategory.lighting, modelPath: 'models/lamp_02.glb', dimensions: Vector3(0.2, 0.5, 0.2)),
    // Paintings
    CatalogItemModel(id: 'painting_01', name: 'Abstract Canvas', category: ItemCategory.decor, modelPath: 'models/painting_01.glb', dimensions: Vector3(1.2, 0.8, 0.05)),
    // Plants
    CatalogItemModel(id: 'plant_01', name: 'Potted Fiddle Leaf', category: ItemCategory.plants, modelPath: 'models/plant_01.glb', dimensions: Vector3(0.5, 1.2, 0.5)),
    CatalogItemModel(id: 'plant_02', name: 'Hanging Plant', category: ItemCategory.plants, modelPath: 'models/plant_02.glb', dimensions: Vector3(0.4, 0.8, 0.4)),
    // Rugs
    CatalogItemModel(id: 'rug_01', name: 'Persian Rug', category: ItemCategory.rugs, modelPath: 'models/rug_01.glb', dimensions: Vector3(2.0, 0.01, 3.0)),
  ];

  final List<PaintColorModel> _mockPaintColors = [
    PaintColorModel(id: 'paint_01', name: 'Cloud White', color: const Color(0xFFF0F0F0), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_02', name: 'Navy Blue', color: const Color(0xFF000080), texture: PaintTexture.glossy),
    PaintColorModel(id: 'paint_03', name: 'Sage Green', color: const Color(0xFFB2AC88), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_04', name: 'Terracotta', color: const Color(0xFFE2725B), texture: PaintTexture.textured),
    PaintColorModel(id: 'paint_05', name: 'Charcoal Gray', color: const Color(0xFF36454F), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_06', name: 'Beige', color: const Color(0xFFF5F5DC), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_07', name: 'Deep Red', color: const Color(0xFF8B0000), texture: PaintTexture.glossy),
    PaintColorModel(id: 'paint_08', name: 'Sunny Yellow', color: const Color(0xFFFFFAA0), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_09', name: 'Sky Blue', color: const Color(0xFF87CEEB), texture: PaintTexture.matte),
    PaintColorModel(id: 'paint_10', name: 'Gunmetal', color: const Color(0xFF2C3539), texture: PaintTexture.textured),
  ];
}