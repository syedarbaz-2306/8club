import 'package:flutter/material.dart';
import 'package:hotspot/core/my_logger.dart';
import 'package:hotspot/models/experience_model.dart';
import 'package:hotspot/services/api_service.dart';

class OnboardingPvdr extends ChangeNotifier {
  //states
  int _currentStep = 1;
  final int _totalSteps = 2;
  bool _initialized = false;
  List<ExperienceModel> _expList = [];
  final List<ExperienceModel> _selectedExpList = [];
  String _expDesc = "";
  String _whyHostWithUs = "";
  bool _audioRecording = false;
  String? _audioFilePath;
  bool _videoRecording = false;

  //getters
  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;
  bool get initialized => _initialized;
  List<ExperienceModel> get expList => _expList;
  List<ExperienceModel> get selectedExpList => _selectedExpList;
  String get expDesc => _expDesc;
  String get whyHostWithUs => _whyHostWithUs;
  bool get audioRecording => _audioRecording;
  String? get audioFilePath => _audioFilePath;
  bool get videoRecording => _videoRecording;

  OnboardingPvdr() {
    if (!_initialized) {
      fetchExpList();
    }
  }

  Future<void> fetchExpList() async {
    try {
      final ApiService apiService = ApiService();
      final data = await apiService.avaiableExp();
      _expList = data;
      _initialized = true;
      notifyListeners();
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void nextStep() {
    if (_currentStep == _totalSteps) {
      printStates();
      return;
    }
    _currentStep++;
    notifyListeners();
  }

  void prevStep() {
    if (_currentStep <= 1) {
      return;
    }
    _currentStep--;
    notifyListeners();
  }

  void updateSelectedExpList(ExperienceModel exp) {
    if (_selectedExpList.contains(exp)) {
      _selectedExpList.remove(exp);
    } else {
      _selectedExpList.add(exp);
    }
    logger.f(_selectedExpList.map((exp) => exp.toJson()).toList());
    notifyListeners();
  }

  void setExpDesc(String desc) {
    _expDesc = desc;
    notifyListeners();
  }

  void setWhyHostWithUs(String txt) {
    _whyHostWithUs = txt;
    notifyListeners();
  }

  void setAudioRecording(bool flag) {
    _audioRecording = flag;
    notifyListeners();
  }

  void setAudioFilePath(String? path) {
    _audioFilePath = path;
    notifyListeners();
  }

  void setVideoRecording(bool flag) {
    _videoRecording = flag;
    notifyListeners();
  }

  void printStates() {
    logger.f(
        "selected experiences ${_selectedExpList.map((exp) => exp.toJson()).toList()}");
    logger.f("description $_expDesc");
    logger.f("why host with us $_whyHostWithUs");
    logger.f("recorded audio file path $_audioFilePath");
  }
}
