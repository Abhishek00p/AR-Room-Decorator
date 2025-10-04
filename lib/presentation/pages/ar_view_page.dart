import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_decorator/core/utils/permission_manager.dart';
import 'package:room_decorator/presentation/bloc/ar_session_bloc.dart';

class ARViewPage extends StatelessWidget {
  const ARViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ARSessionBloc()..add(ARSessionStarted()),
      child: const _ARViewScaffold(),
    );
  }
}

class _ARViewScaffold extends StatefulWidget {
  const _ARViewScaffold();

  @override
  State<_ARViewScaffold> createState() => _ARViewScaffoldState();
}

class _ARViewScaffoldState extends State<_ARViewScaffold> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final isGranted = await PermissionManager.requestCameraPermission();
    if (!isGranted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Camera permission is required for AR functionality.'),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Decorator'),
      ),
      body: BlocBuilder<ARSessionBloc, ARSessionState>(
        builder: (context, state) {
          if (state is ARSessionLoading || state is ARSessionInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ARSessionFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const _ARView();
        },
      ),
    );
  }
}

class _ARView extends StatelessWidget {
  const _ARView();

  @override
  Widget build(BuildContext context) {
    return ARView(
      onARViewCreated: (
        ARSessionManager sessionManager,
        ARObjectManager objectManager,
        ARAnchorManager anchorManager,
        ARLocationManager locationManager,
      ) {
        sessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true, // Visualize detected planes for now.
          showWorldOrigin: false,
          handleTaps: false,
        );
        objectManager.onInitialize();

        // Listen for new anchors (planes) and notify the BLoC.
        // For now, we just let the plugin visualize the planes.
        anchorManager.onAnchorAdded = (ARAnchor anchor) {
          if (anchor is ARPlaneAnchor) {
            // In the future, we can dispatch an event to the BLoC here.
            // e.g., context.read<ARSessionBloc>().add(ARPlaneDetected([...]));
          }
        };
      },
      planeDetectionConfig: PlaneDetectionConfig.horizontal,
    );
  }
}