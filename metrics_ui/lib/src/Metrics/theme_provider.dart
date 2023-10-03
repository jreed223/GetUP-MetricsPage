import 'package:flutter/material.dart';

/// This class is used to provide the themes to the app

class ThemeProvider extends ChangeNotifier {
  /// Make this a singleton class
  ThemeProvider._mainInstanceCreator();

  /// This is the only instance of the class
  static final ThemeProvider _mainInstance =
      ThemeProvider._mainInstanceCreator();

  /// This is the factory constructor for the class
  /// It is used to return the "main instance" of the class
  factory ThemeProvider() {
    return _mainInstance;
  }

  /// This will be used to toggle between dark and light mode
  /// The default value is false, which means light mode
  bool _isDarkMode = false;

  /// These will be the colors used in the app

  Color _scaffoldColor = const Color.fromARGB(255, 255, 247, 244);
  Color _textColor = Colors.black54;
  Color _buttonColor = const Color.fromARGB(255, 255, 144, 39);
  Color _buttonTextColor = Colors.white;
  Color _buttonIconColor = Colors.white;
  Color _incompleteCardColor = const Color.fromARGB(255, 255, 244, 237);
  Color _incompleteCardBorderColor = const Color.fromARGB(255, 255, 230, 214);
  Color _completeCardColor = const Color.fromARGB(255, 235, 255, 240);
  Color _completeCardBorderColor = const Color.fromARGB(255, 219, 255, 222);
  Color _minHourSelectorColor = const Color.fromARGB(255, 255, 213, 177);
  Color _shadowColor = const Color.fromARGB(23, 0, 0, 0);
  LinearGradient _incompleteGradient = const LinearGradient(
    colors: [
      Colors.orangeAccent,
      Colors.orange,
      Colors.deepOrangeAccent,
      Colors.deepOrange
    ],
  );
  LinearGradient _completeGradient = const LinearGradient(
    colors: [
      Colors.greenAccent,
      Colors.green,
    ],
  );

  /// These are the getters for the colors
  bool get isDarkMode => _isDarkMode;
  Color get scaffoldColor => _scaffoldColor;
  Color get textColor => _textColor;
  Color get buttonColor => _buttonColor;
  Color get buttonTextColor => _buttonTextColor;
  Color get buttonIconColor => _buttonIconColor;
  Color get incompleteCardColor => _incompleteCardColor;
  Color get incompleteCardBorderColor => _incompleteCardBorderColor;
  Color get completeCardColor => _completeCardColor;
  Color get completeCardBorderColor => _completeCardBorderColor;
  Color get minHourSelectorColor => _minHourSelectorColor;
  Color get shadowColor => _shadowColor;
  LinearGradient get incompleteGradient => _incompleteGradient;
  LinearGradient get completeGradient => _completeGradient;

  /// This method will be used to toggle between dark and light mode
  void toggleTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    if (_isDarkMode) {
      _scaffoldColor = const Color.fromARGB(255, 42, 38, 36);
      _textColor = const Color.fromARGB(255, 255, 247, 244);
      _buttonColor = const Color.fromARGB(255, 255, 144, 39);
      _buttonTextColor = Colors.white;
      _buttonIconColor = Colors.white;
      _incompleteCardColor = const Color.fromARGB(255, 77, 69, 65);
      _incompleteCardBorderColor = const Color.fromARGB(255, 104, 71, 41);
      _completeCardColor = const Color.fromARGB(255, 69, 96, 76);
      _completeCardBorderColor = const Color.fromARGB(255, 22, 83, 38);
      _minHourSelectorColor = const Color.fromARGB(95, 14, 13, 13);
      _shadowColor = Color.fromARGB(166, 0, 0, 0);
      _incompleteGradient = const LinearGradient(
        colors: [
          Colors.orangeAccent,
          Colors.orange,
          Colors.deepOrangeAccent,
          Colors.deepOrange
        ],
      );
      _completeGradient = const LinearGradient(
        colors: [
          Color.fromARGB(255, 39, 203, 124),
          Color.fromARGB(255, 22, 161, 24),
        ],
      );
      notifyListeners();
    } else {
      _scaffoldColor = const Color.fromARGB(255, 255, 247, 244);
      _textColor = Colors.black54;
      _buttonColor = const Color.fromARGB(255, 255, 144, 39);
      _buttonTextColor = Colors.white;
      _buttonIconColor = Colors.white;
      _incompleteCardColor = const Color.fromARGB(255, 255, 242, 235);
      _incompleteCardBorderColor = const Color.fromARGB(255, 255, 230, 214);
      _completeCardColor = const Color.fromARGB(255, 235, 255, 240);
      _completeCardBorderColor = const Color.fromARGB(255, 219, 255, 222);
      _minHourSelectorColor = const Color.fromARGB(255, 255, 213, 177);
      _shadowColor = const Color.fromARGB(20, 0, 0, 0);
      _incompleteGradient = const LinearGradient(
        colors: [
          Colors.orangeAccent,
          Colors.orange,
          Colors.deepOrangeAccent,
          Colors.deepOrange
        ],
      );
      _completeGradient = const LinearGradient(
        colors: [
          Colors.greenAccent,
          Colors.green,
        ],
      );
      notifyListeners();
    }
  }
}
