import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:hotspot/core/my_logger.dart';

class AudioRecordingPvdr extends ChangeNotifier {
  // Core libs
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  // State
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _filePath;

  // Public getters
  bool get isRecording => _isRecording;
  bool get isPlaying => _isPlaying;
  String? get filePath => _filePath;

  // ------------------ Recording ------------------

  Future<bool> _ensurePermission() async {
    final hasPerm = await _recorder.hasPermission();
    if (!hasPerm) {
      logger.e('Microphone permission denied');
    }
    return hasPerm;
  }

  Future<void> toggleRecording() async {
    if (_isRecording) {
      await stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    final ok = await _ensurePermission();
    if (!ok) return;

    // Get directory path
    final dir = await getApplicationDocumentsDirectory();
    final path =
        '${dir.path}/my_recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

    // Start recording
    await _recorder.start(
      const RecordConfig(),
      path: path,
    );

    _isRecording = true;
    _filePath = null;
    notifyListeners();
  }

  Future<void> stopRecording() async {
    if (!_isRecording) return;

    try {
      final path = await _recorder.stop();

      _isRecording = false;
      if (path != null && path.isNotEmpty) {
        _filePath = path;
        logger.i('Recording stopped, file: $path');
        // Prepare player source & metadata
        await _player.setSource(DeviceFileSource(path));
        // onDurationChanged will update _playerTotal
      } else {
        logger.w('Recording stopped but no path returned.');
      }
      notifyListeners();
    } catch (e, st) {
      logger.e('Failed to stop recording: $e\n$st');
      _isRecording = false;
      notifyListeners();
    }
  }

  // ------------------ Playback ------------------

  Future<void> togglePlayPause() async {
    if (_filePath == null) return;
    if (_isPlaying) {
      await _player.pause();
      _isPlaying = false;
      notifyListeners();
    } else {
      await _player.play(DeviceFileSource(_filePath!));
      _isPlaying = true;
      notifyListeners();
    }
    // player stream will update isPlaying and position
  }

  Future<void> seek(Duration to) async {
    await _player.seek(to);
    // position stream will update playerPosition
  }

  Future<void> stopPlayback() async {
    await _player.stop();
  }

  // Delete the recorded file from disk (if exists)
  Future<void> deleteRecording() async {
    final p = _filePath;
    if (p == null) return;
    try {
      final f = File(p);
      if (await f.exists()) {
        await f.delete();
        logger.i('Recording file deleted: $p');
      }
    } catch (e) {
      logger.e('Error deleting recording: $e');
    } finally {
      _filePath = null;
      notifyListeners();
    }
  }

  // ------------------ Cleanup ------------------

  @override
  void dispose() {
    _player.dispose();
    _recorder.dispose();
    super.dispose();
  }
}
