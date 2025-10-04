part of 'ar_session_bloc.dart';

abstract class ARSessionState extends Equatable {
  const ARSessionState();

  @override
  List<Object> get props => [];
}

class ARSessionInitial extends ARSessionState {}

class ARSessionLoading extends ARSessionState {}

class ARSessionActive extends ARSessionState {
  final List<ARPlane> planes;

  const ARSessionActive({this.planes = const []});

  @override
  List<Object> get props => [planes];
}

class ARSessionFailure extends ARSessionState {
  final String error;

  const ARSessionFailure(this.error);

  @override
  List<Object> get props => [error];
}