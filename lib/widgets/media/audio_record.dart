import 'package:flutter/material.dart';
import 'package:hotspot/core/my_logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioRecord extends StatefulWidget {
  const AudioRecord({super.key});

  @override
  State<AudioRecord> createState() => _AudioRecordState();
}

class _AudioRecordState extends State<AudioRecord> {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();
  bool _isRecording = false;
  String? _filePath;

  Future<void> _startRecording() async {
    // Request microphone permission
    final micStatus = await _audioRecorder.hasPermission();
    if (!micStatus) return;

    // Get directory path
    final dir = await getApplicationDocumentsDirectory();
    final path =
        '${dir.path}/my_recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

    // Start recording
    await _audioRecorder.start(
      const RecordConfig(),
      path: path,
    );

    setState(() {
      _isRecording = true;
      _filePath = path;
    });
  }

  Future<void> _stopRecording() async {
    final path = await _audioRecorder.stop();
    setState(() => _isRecording = false);

    if (path != null) {
      debugPrint('Recorded file saved at: $path');
      _filePath = path;
    }
  }

  Future<void> _playRecording() async {
    if (_filePath == null) {
      logger.e("no recording avaable");
      return;
    }
    await _player.setSourceDeviceFile(_filePath!);
    logger.f(_filePath);
    _player.play(
      DeviceFileSource(_filePath!),
      volume: 1,
      mode: PlayerMode.mediaPlayer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Audio Recorder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isRecording ? Icons.mic : Icons.mic_none,
              color: _isRecording ? Colors.red : Colors.white,
              size: 64,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _playRecording,
              child: const Text('Play Last Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
