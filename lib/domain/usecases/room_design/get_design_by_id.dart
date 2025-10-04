import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class GetDesignById implements UseCase<RoomDesign, GetDesignByIdParams> {
  final RoomDesignRepository repository;

  GetDesignById(this.repository);

  @override
  Future<Either<Failure, RoomDesign>> call(GetDesignByIdParams params) async {
    return await repository.getDesignById(params.id);
  }
}

class GetDesignByIdParams extends Equatable {
  final String id;

  const GetDesignByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}