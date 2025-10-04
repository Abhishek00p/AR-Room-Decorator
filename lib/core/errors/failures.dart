import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class StorageFailure extends Failure {
  const StorageFailure(String message) : super(message);
}

// Feature-specific failures
class ARSessionFailure extends Failure {
  const ARSessionFailure(String message) : super(message);
}

class PlacementFailure extends Failure {
  const PlacementFailure(String message) : super(message);
}

class CatalogLoadFailure extends Failure {
  const CatalogLoadFailure(String message) : super(message);
}