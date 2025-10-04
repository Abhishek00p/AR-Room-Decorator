import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class SaveRoomDesign implements UseCase<void, SaveRoomDesignParams> {
  final RoomDesignRepository repository;

  SaveRoomDesign(this.repository);

  @override
  Future<Either<Failure, void>> call(SaveRoomDesignParams params) async {
    return await repository.saveDesign(params.design);
  }
}

class SaveRoomDesignParams extends Equatable {
  final RoomDesign design;

  const SaveRoomDesignParams({required this.design});

  @override
  List<Object> get props => [design];
}