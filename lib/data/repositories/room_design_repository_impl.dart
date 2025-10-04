import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/exceptions.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/data/datasources/room_design_local_datasource.dart';
import 'package:room_decorator/data/models/room_design_model.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';

class RoomDesignRepositoryImpl implements RoomDesignRepository {
  final RoomDesignLocalDataSource localDataSource;

  RoomDesignRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> deleteDesign(String id) async {
    try {
      await localDataSource.deleteDesign(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(StorageFailure('Failed to delete design: ${e.message}'));
    } catch (e) {
      return Left(StorageFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RoomDesign>> getDesignById(String id) async {
    try {
      final design = await localDataSource.getDesignById(id);
      return Right(design);
    } on CacheException catch (e) {
      return Left(StorageFailure('Failed to load design: ${e.message}'));
    } catch (e) {
      return Left(StorageFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<RoomDesign>>> getSavedDesigns() async {
    try {
      final designs = await localDataSource.getSavedDesigns();
      return Right(designs);
    } on CacheException catch (e) {
      return Left(StorageFailure('Failed to load saved designs: ${e.message}'));
    } catch (e) {
      return Left(StorageFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> saveDesign(RoomDesign design) async {
    try {
      final designModel = RoomDesignModel.fromEntity(design);
      await localDataSource.saveDesign(designModel);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(StorageFailure('Failed to save design: ${e.message}'));
    } catch (e) {
      return Left(StorageFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}