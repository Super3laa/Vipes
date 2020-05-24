import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidg extends StatelessWidget {
  final CameraController controller;
  CameraWidg(this.controller);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRect(
        child: Transform.scale(
          scale: (size.aspectRatio / controller.value.aspectRatio) * 1.2,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
        ),
      );
    
  }
}
