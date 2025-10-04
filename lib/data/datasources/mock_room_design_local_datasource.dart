import 'package:room_decorator/core/errors/exceptions.dart';
import 'package:room_decorator/data/datasources/room_design_local_datasource.dart';
import 'package:room_decorator/data/models/room_design_model.dart';

class MockRoomDesignLocalDataSource implements RoomDesignLocalDataSource {
  final Map<String, RoomDesignModel> _designs = {};
  RoomDesignModel? _cachedDesign;

  @override
  Future<void> deleteDesign(String id) async {
    if (_designs.containsKey(id)) {
      _designs.remove(id);
      return;
    }
    throw CacheException('Design with id $id not found.');
  }

  @override
  Future<RoomDesignModel> getDesignById(String id) async {
    if (_designs.containsKey(id)) {
      return _designs[id]!;
    }
    throw CacheException('Design with id $id not found.');
  }

  @override
  Future<List<RoomDesignModel>> getSavedDesigns() async {
    return _designs.values.toList();
  }

  @override
  Future<void> saveDesign(RoomDesignModel design) async {
    _designs[design.id] = design;
  }

  @override
  Future<void> cacheDesign(RoomDesignModel design) async {
    _cachedDesign = design;
  }
}