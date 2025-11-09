import 'package:flutter/material.dart';
import 'package:hotspot/provider/onboarding_pvdr.dart';
import 'package:hotspot/styles/app_styles.dart';
import 'package:hotspot/widgets/common/gradient_button.dart';
import 'package:hotspot/widgets/common/media_buttons.dart';
import 'package:hotspot/widgets/media/audio_recording_widget.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingPvdr>(
      builder: (context, value, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.all($styles.insets.sm),
                  child: Column(
                    spacing: $styles.insets.sm,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0${value.currentStep.toString()}",
                        style: $styles.fonts.subtitle1Regular.copyWith(
                          color: $styles.colors.text5,
                        ),
                      ),
                      Text(
                        "Why do you want to host with us?",
                        style: $styles.fonts.h2Bold,
                      ),
                      Text(
                        "Tell us about your intent and what motivates you to create experiences.",
                        style: $styles.fonts.body2Regular.copyWith(
                          color: $styles.colors.text3,
                        ),
                      ),
                      TextField(
                        maxLines: null,
                        minLines: value.audioRecording ? 5 : 10,
                        keyboardType: TextInputType.multiline,
                        maxLength: 600,
                        style: $styles.fonts.h3Regular.copyWith(
                          color: $styles.colors.text1,
                        ),
                        onChanged: (text) {
                          if (text.length <= 3) {
                            return;
                          }
                          value.setWhyHostWithUs(text);
                        },
                        decoration: InputDecoration(
                          hintText: "/ Start typing here",
                          hintStyle: $styles.fonts.h3Regular.copyWith(
                            color: $styles.colors.text5,
                          ),
                          filled: true,
                          fillColor: $styles.colors.surfaceWhite1,
                          contentPadding: EdgeInsets.all($styles.insets.sm),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($styles.insets.xs),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($styles.insets.xs),
                            borderSide: BorderSide(
                              color: $styles.colors.primaryAccent,
                              width: 2.0,
                            ),
                          ),
                          counter: const SizedBox.shrink(),
                        ),
                      ),
                      if (value.audioRecording) ...[
                        const AudioRecordingWidget(),
                      ],
                      Row(
                        spacing: $styles.insets.sm,
                        children: [
                          MediaButtons(
                            audioRecorded: value.audioFilePath != null,
                            onAudioClick: () {
                              value.setAudioRecording(!value.audioRecording);
                            },
                            onVideoClick: () {
                              // value.setVideoRecording(!value.videoRecording);
                            },
                          ),
                          Expanded(
                            child: GradientButton(
                              label: "Next",
                              icon: LucideIcons.arrowBigRightDash,
                              isEnabled: value.whyHostWithUs.isNotEmpty && value.audioFilePath != null,
                              onPressed: () {
                                value.nextStep();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
