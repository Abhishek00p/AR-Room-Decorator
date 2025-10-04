part of 'ar_session_bloc.dart';

abstract class ARSessionEvent extends Equatable {
  const ARSessionEvent();

  @override
  List<Object> get props => [];
}

class ARSessionStarted extends ARSessionEvent {}

class ARSessionStopped extends ARSessionEvent {}

class ARPlaneDetected extends ARSessionEvent {
  final List<ARPlane> planes;

  const ARPlaneDetected(this.planes);

  @override
  List<Object> get props => [planes];
}