import 'package:flutter/material.dart';
import 'package:hotspot/styles/app_styles.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MediaButtons extends StatelessWidget {
  final bool audioEnabled;
  final bool videoEnabled;
  final bool audioRecorded;
  final bool videoRecorded;
  final VoidCallback onAudioClick;
  final VoidCallback onVideoClick;
  const MediaButtons({
    super.key,
    this.audioEnabled = true,
    this.videoEnabled = true,
    this.audioRecorded = false,
    this.videoRecorded = false,
    required this.onAudioClick,
    required this.onVideoClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: $styles.colors.text4,
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(
          $styles.insets.sm,
        ),
      ),
      child: Row(
        children: [
          if (!audioRecorded) ...[
            GestureDetector(
              onTap: audioEnabled ? onAudioClick : null,
              child: Container(
                padding: EdgeInsets.all($styles.insets.sm),
                child: Icon(
                  LucideIcons.mic300,
                  color: audioEnabled
                      ? $styles.colors.text1
                      : $styles.colors.text4,
                ),
              ),
            ),
          ],
          if (!videoRecorded) ...[
            GestureDetector(
              onTap: videoEnabled ? onVideoClick : null,
              child: Container(
                padding: EdgeInsets.all($styles.insets.sm),
                child: Icon(
                  LucideIcons.video300,
                  color: videoEnabled
                      ? $styles.colors.text1
                      : $styles.colors.text4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
