import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_event.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/take_pic/take_pic_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/take_pic/take_pic_event.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/take_pic/take_pic_state.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';

class TakePicScreen extends StatefulWidget {
  const TakePicScreen({super.key});

  @override
  State<TakePicScreen> createState() => _TakePicScreenState();
}

class _TakePicScreenState extends State<TakePicScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<TakePicBloc>();
    bloc.add(const TakePicRequestPermission());
    bloc.add(const TakePicInitCamera(lens: CameraLensDirection.front));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<TakePicBloc, TakePicState>(
        listener: (context, state) {
          if (state is CamCaptured && state.path.isNotEmpty) {
            context.read<QuestionereBloc>().add(
              QuestionereAddPhoto(path: state.path.first),
            );
          }
        },
        child: BlocBuilder<TakePicBloc, TakePicState>(
          builder: (context, state) {
            final bloc = context.read<TakePicBloc>();
            if (state is CamReady &&
                bloc.controller != null &&
                bloc.controller!.value.isInitialized) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Builder(
                      builder: (context) {
                        final controller = bloc.controller!;
                        final previewSize = controller.value.previewSize;
                        if (previewSize == null) {
                          return CameraPreview(controller);
                        }
                        return FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: previewSize.width,
                            height: previewSize.height,
                            child: CameraPreview(controller),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: SafeArea(
                      child: Material(
                        color: Colors.black45,
                        shape: const CircleBorder(),
                        child: IconButton(
                          icon: const Icon(
                            Icons.cameraswitch,
                            color: Colors.white,
                          ),
                          onPressed: () => bloc.add(const TakePicSwitchLens()),
                          tooltip: 'Switch camera',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 84,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: ColorStyle.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                bloc.capturedPaths.reversed
                                    .take(3)
                                    .map(
                                      (p) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.file(
                                            File(p),
                                            width: 84,
                                            height: 84,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => bloc.add(const TakePicTakePicture()),
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is CamPermissionDenied) {
              return const Center(child: Text('Permission denied'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
