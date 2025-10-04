import 'package:dartz/dartz.dart';
import 'package:room_decorator/core/errors/failures.dart';
import 'package:room_decorator/domain/entities/room_design_entity.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';
import 'package:room_decorator/domain/usecases/usecase.dart';

class GetSavedDesigns implements UseCase<List<RoomDesign>, NoParams> {
  final RoomDesignRepository repository;

  GetSavedDesigns(this.repository);

  @override
  Future<Either<Failure, List<RoomDesign>>> call(NoParams params) async {
    return await repository.getSavedDesigns();
  }
}