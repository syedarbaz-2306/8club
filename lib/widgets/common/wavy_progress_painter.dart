import 'dart:math';
import 'package:flutter/material.dart';

class WavyProgressPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  final Color progressColor;
  final Color trackColor;
  final double strokeWidth = 3.0;

  WavyProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double waveAmplitude = height / 8; // Height of the wave crest
    const double waveFrequency = 10.0; // Number of full waves across the bar
    const double pi = 3.141592653589793;

    // Paint for the track (un-filled part)
    final Paint trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Paint for the progress (filled part)
    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Function to calculate the y-coordinate for the wave
    double calculateY(double x) {
      // Sine wave equation: y = A * sin(f * x) + offset
      // FIX: Use sin() function directly instead of calling .sin() on the double
      return waveAmplitude * sin((x / width) * waveFrequency * 2 * pi) +
          (height / 2);
    }

    // Path for the full wavy line
    final Path fullPath = Path();
    fullPath.moveTo(0, calculateY(0));

    // Draw the track (full width)
    for (double x = 0; x <= width; x++) {
      fullPath.lineTo(x, calculateY(x));
    }
    canvas.drawPath(fullPath, trackPaint);

    // --- Draw Progress ---
    final double progressWidth = width * progress;
    final Path progressPath = Path();
    progressPath.moveTo(0, calculateY(0));

    // Draw the progress section up to the progress width
    for (double x = 0; x <= progressWidth; x++) {
      progressPath.lineTo(x, calculateY(x));
    }
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(covariant WavyProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
