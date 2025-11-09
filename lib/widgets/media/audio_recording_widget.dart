import 'package:flutter/material.dart';
import 'package:hotspot/provider/audio_recording_pvdr.dart';
import 'package:hotspot/provider/onboarding_pvdr.dart';
import 'package:hotspot/styles/app_styles.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class AudioRecordingWidget extends StatelessWidget {
  const AudioRecordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AudioRecordingPvdr, OnboardingPvdr>(
      builder: (context, value, onbnPvdr, _) {
        final fileExists = value.filePath != null && value.filePath!.isNotEmpty;
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all($styles.insets.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($styles.insets.sm),
            border: Border.all(color: $styles.colors.text4, width: 0.2),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.05, 0.5, 0.95],
              colors: [
                $styles.colors.base1,
                $styles.colors.text5,
                $styles.colors.base1,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: $styles.insets.sm,
            children: [
              if (fileExists) ...[
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: $styles.insets.sm,
                        children: [
                          GestureDetector(
                            onTap: value.togglePlayPause,
                            child: Container(
                              padding: EdgeInsets.all($styles.insets.xs),
                              decoration: BoxDecoration(
                                color: $styles.colors.primaryAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                value.isPlaying
                                    ? LucideIcons.pause
                                    : LucideIcons.play,
                              ),
                            ),
                          ),
                          Text(
                            "Audio Recorded",
                            style: $styles.fonts.body1Regular,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await value.deleteRecording();
                        onbnPvdr.setAudioFilePath(null);
                      },
                      child: Icon(
                        LucideIcons.trash2,
                        color: $styles.colors.primaryAccent,
                      ),
                    )
                  ],
                )
              ],
              if (!fileExists) ...[
                Text(
                  value.isRecording ? "Reacording Audio..." : "Record Audio",
                  style: $styles.fonts.body1Regular,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await value.toggleRecording();
                        if (value.filePath != null) {
                          onbnPvdr.setAudioFilePath(value.filePath);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all($styles.insets.xs),
                        decoration: BoxDecoration(
                          color: $styles.colors.primaryAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          value.isRecording
                              ? LucideIcons.pause
                              : LucideIcons.mic,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
