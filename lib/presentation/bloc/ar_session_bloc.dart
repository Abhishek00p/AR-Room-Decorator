import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ar_session_event.dart';
part 'ar_session_state.dart';

// Placeholder for a proper domain entity. Will be moved later.
class ARPlane extends Equatable {
  final String id;
  const ARPlane(this.id);

  @override
  List<Object> get props => [id];
}


class ARSessionBloc extends Bloc<ARSessionEvent, ARSessionState> {
  ARSessionBloc() : super(ARSessionInitial()) {
    on<ARSessionStarted>(_onARSessionStarted);
    on<ARPlaneDetected>(_onARPlaneDetected);
    on<ARSessionStopped>(_onARSessionStopped);
  }

  Future<void> _onARSessionStarted(
    ARSessionStarted event,
    Emitter<ARSessionState> emit,
  ) async {
    emit(ARSessionLoading());
    try {
      // Here you would initialize the AR session with the chosen plugin.
      // For now, we'll just transition to the active state.
      await Future.delayed(const Duration(seconds: 1)); // Simulate initialization.
      emit(const ARSessionActive());
    } catch (e) {
      emit(ARSessionFailure('Failed to start AR session: ${e.toString()}'));
    }
  }

  void _onARPlaneDetected(
    ARPlaneDetected event,
    Emitter<ARSessionState> emit,
  ) {
    if (state is ARSessionActive) {
      emit(ARSessionActive(planes: event.planes));
    }
  }

  void _onARSessionStopped(
    ARSessionStopped event,
    Emitter<ARSessionState> emit,
  ) {
    // Here you would properly dispose of the AR session.
    emit(ARSessionInitial());
  }
}