import 'package:room_decorator/data/models/room_design_model.dart';

abstract class RoomDesignLocalDataSource {
  Future<List<RoomDesignModel>> getSavedDesigns();
  Future<RoomDesignModel> getDesignById(String id);
  Future<void> saveDesign(RoomDesignModel design);
  Future<void> deleteDesign(String id);
  Future<void> cacheDesign(RoomDesignModel design);
}