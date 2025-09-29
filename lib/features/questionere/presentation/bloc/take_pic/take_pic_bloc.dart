import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/utils/services/navigation_service.dart';

import 'take_pic_event.dart';
import 'take_pic_state.dart';

class TakePicBloc extends Bloc<TakePicEvent, TakePicState> {
  CameraController? _controller;
  final List<String> _capturedPaths = [];

  TakePicBloc() : super(const TakePicState.camInitializing()) {
    on<TakePicRequestPermission>(_onRequestPermission);
    on<TakePicInitCamera>(_onInitCamera);
    on<TakePicSwitchLens>(_onSwitchLens);
    on<TakePicTakePicture>(_onTakePicture);
    on<TakePicErrorCleared>(_onErrorCleared);
  }

  Future<void> _onRequestPermission(
    TakePicRequestPermission event,
    Emitter<TakePicState> emit,
  ) async {
    emit(const TakePicState.camInitializing());
  }

  Future<void> _onInitCamera(
    TakePicInitCamera event,
    Emitter<TakePicState> emit,
  ) async {
    await _controller?.dispose();
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
      (c) => c.lensDirection == event.lens,
      orElse: () => cameras.first,
    );
    _controller = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    await _controller!.initialize();
    await _controller!.setFlashMode(FlashMode.off);
    emit(TakePicState.camReady(lens: event.lens));
  }

  Future<void> _onSwitchLens(
    TakePicSwitchLens event,
    Emitter<TakePicState> emit,
  ) async {
    if (_controller == null) return;
    final currentLens = _controller!.description.lensDirection;
    final newLens =
        currentLens == CameraLensDirection.front
            ? CameraLensDirection.back
            : CameraLensDirection.front;
    add(TakePicInitCamera(lens: newLens));
  }

  Future<void> _onTakePicture(
    TakePicTakePicture event,
    Emitter<TakePicState> emit,
  ) async {
    // Enforce max 3 photos: if already 3, return to questionere
    if (_capturedPaths.length >= 3) {
      final ctx = NavigationService.context;
      if (Navigator.of(ctx).canPop()) {
        Navigator.of(ctx).pop();
      } else {
        Navigator.of(ctx).pushReplacementNamed(RouteConstants.questionere);
      }
      return;
    }
    if (_controller == null || !_controller!.value.isInitialized) return;
    final xfile = await _controller!.takePicture();

    final confirmed =
        await showDialog<bool>(
          context: NavigationService.context,
          barrierDismissible: true,
          builder:
              (ctx) => AlertDialog(
                title: const Text('Use this photo?'),
                content: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(File(xfile.path), fit: BoxFit.cover),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: const Text('Retake'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    child: const Text('Use Photo'),
                  ),
                ],
              ),
        ) ??
        false;

    if (confirmed) {
      _capturedPaths.add(xfile.path);
      emit(TakePicState.camCaptured(path: [xfile.path]));

      // If we've reached 3 photos after confirming, navigate back
      if (_capturedPaths.length >= 3) {
        final ctx = NavigationService.context;
        if (Navigator.of(ctx).canPop()) {
          Navigator.of(ctx).pop();
        } else {
          Navigator.of(ctx).pushReplacementNamed(RouteConstants.questionere);
        }
        return;
      }
    } else {
      // Clean up if user cancels
      try {
        final f = File(xfile.path);
        if (await f.exists()) {
          await f.delete();
        }
      } catch (_) {}
    }

    // Return to ready state
    emit(TakePicState.camReady(lens: _controller!.description.lensDirection));
  }

  Future<void> _onErrorCleared(
    TakePicErrorCleared event,
    Emitter<TakePicState> emit,
  ) async {
    emit(const TakePicState.camInitializing());
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }

  CameraController? get controller => _controller;
  List<String> get capturedPaths => List.unmodifiable(_capturedPaths);
}
