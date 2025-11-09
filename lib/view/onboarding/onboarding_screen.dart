import 'package:flutter/material.dart';
import 'package:hotspot/provider/onboarding_pvdr.dart';
import 'package:hotspot/view/onboarding/experience.dart';
import 'package:hotspot/view/onboarding/question.dart';
import 'package:hotspot/widgets/common/stepped_appbar.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingPvdr>(
      builder: (context, value, _) {
        if (!value.initialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: SteppedAppbar(
            currentStep: value.currentStep,
            totalSteps: value.totalSteps,
            onBack: () {
              value.prevStep();
            },
          ),
          body: Stack(
            children: [
              Image.asset(
                "lib/assets/common/body_bg.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              _buildSteps(value),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSteps(OnboardingPvdr pvdr) {
    switch (pvdr.currentStep) {
      case 1:
        return const Experience();
      case 2:
        return const Question();
      default:
        return const SizedBox.shrink();
    }
  }
}
