import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class DeleteRoomDesign implements UseCase<void, DeleteRoomDesignParams> {
  final RoomDesignRepository repository;

  DeleteRoomDesign(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteRoomDesignParams params) async {
    return await repository.deleteDesign(params.id);
  }
}

class DeleteRoomDesignParams extends Equatable {
  final String id;

  const DeleteRoomDesignParams({required this.id});

  @override
  List<Object> get props => [id];
}