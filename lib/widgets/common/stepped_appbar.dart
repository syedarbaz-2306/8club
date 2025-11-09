import 'package:flutter/material.dart';
import 'package:hotspot/styles/app_styles.dart';
import 'package:hotspot/widgets/common/wavy_progress_painter.dart';

class SteppedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  const SteppedAppbar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
    this.onClose,
  }) : assert(currentStep >= 0 && currentStep <= totalSteps);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    final double progressValue =
        totalSteps > 0 ? currentStep / totalSteps : 0.0;

    return Container(
      color: $styles.colors.surfaceWhite1,
      padding: const EdgeInsets.only(
        top: 56,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: $styles.colors.text1,
            ),
            onPressed: currentStep > 0 ? onBack : null,
          ),
      
          // Progress Indicator (Wavy Line)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
                child: CustomPaint(
                  painter: WavyProgressPainter(
                    progress: progressValue,
                    progressColor: $styles.colors.primaryAccent,
                    trackColor: $styles.colors.text4,
                  ),
                ),
              ),
            ),
          ),
      
          // Close Button
          IconButton(
            icon: Icon(Icons.close, color: $styles.colors.text1),
            onPressed: onClose ?? () {},
          ),
        ],
      ),
    );
  }
}
