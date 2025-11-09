import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hotspot/core/my_logger.dart';
import 'package:hotspot/provider/audio_recording_pvdr.dart';
import 'package:hotspot/provider/onboarding_pvdr.dart';
import 'package:hotspot/theme/app_theme.dart';
import 'package:hotspot/view/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    logger.e("error loading .env file $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingPvdr()),
        ChangeNotifierProvider(create: (context) => AudioRecordingPvdr()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '8Club',
        theme: AppTheme.darkTheme,
        home: const OnboardingScreen(),
      ),
    );
  }
}
