import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';

abstract class RoomDesignRepository {
  Future<Either<Failure, List<RoomDesign>>> getSavedDesigns();
  Future<Either<Failure, RoomDesign>> getDesignById(String id);
  Future<Either<Failure, void>> saveDesign(RoomDesign design);
  Future<Either<Failure, void>> deleteDesign(String id);
}