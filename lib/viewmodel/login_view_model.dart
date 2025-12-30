import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final List<String> otpValues = List.filled(6, "");
  bool showError = false;

  final Map<String, bool> _obscureTextMap = {};
  
  void notifyFocusChange() {
    notifyListeners();
  }

  bool getObscureText(String fieldName) {
    return _obscureTextMap[fieldName] ?? true;
  }

  void toggleObscureText(String fieldName) {
    _obscureTextMap[fieldName] = !(_obscureTextMap[fieldName] ?? true);
    notifyListeners();
  }
  
  void updateOtp(int index, String value) {
    otpValues[index] = value;
    if (showError && value.isNotEmpty) {
      showError = false;
    }
    notifyListeners();
  }
  
  bool validateOtp() {
    for (String value in otpValues) {
      if (value.isEmpty) {
        showError = true;
        notifyListeners(); 
        return false;
      }
    }
    showError = false;
    notifyListeners(); 
    return true;
  }
  
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String?> _errors = {};

  TextEditingController getController(String fieldName) {
    if (!_controllers.containsKey(fieldName)) {
      _controllers[fieldName] = TextEditingController();
      _controllers[fieldName]!.addListener(() {
        if (_errors[fieldName] != null) {
          _errors[fieldName] = null;
          notifyListeners();
        }
      });
    }
    return _controllers[fieldName]!;
  }

  // Error get karo
  String? getError(String fieldName) {
    return _errors[fieldName];
  }

  // Set error manually (for external controllers)
  void setError(String fieldName, String? error) {
    _errors[fieldName] = error;
    notifyListeners();
  }

  // Clear error manually
  void clearError(String fieldName) {
    _errors[fieldName] = null;
    notifyListeners();
  }

  // **NEW METHOD: Field ki value get karne ke liye**
  String? getFieldValue(String fieldName) {
    final controller = _controllers[fieldName];
    if (controller != null) {
      return controller.text.trim();
    }
    return null;
  }

  // Email validation regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {

    
  
    if (password.length < 6) return false;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    return hasLetter && hasNumber;
  }
  
  bool _isValidPasscode(String passcode) {
    if (passcode.length < 8) return false;
    
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(passcode);
    final hasNumber = RegExp(r'[0-9]').hasMatch(passcode);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(passcode);
    
    return hasLetter && hasNumber && hasSpecialChar;
  }

  // Get field-specific empty error message
  String _getEmptyFieldMessage(String fieldName) {
    switch (fieldName) {
      case 'usernameoremail':
        return 'Enter your username or email';
      case 'fullname':
        return 'Enter your Full name';
      case 'emailaddress':
        return 'Enter your email address';
      case 'password':
        return 'Enter your password';
      case 'passcode':
        return 'Enter your passcode';
      case 'confirmpassword':
        return 'Confirm your password';
      default:
        return 'This field is required';
    }
  }

  // Validate field with internal controller
  bool validateField(String fieldName) {
    final controller = _controllers[fieldName];
    
    // Check if field is empty
    if (controller == null || controller.text.trim().isEmpty) {
      _errors[fieldName] = _getEmptyFieldMessage(fieldName);
      notifyListeners();
      return false;
    }
    
    final text = controller.text.trim();
    
    // Email address validation (for emailaddress field)
    if (fieldName == 'emailaddress') {
      if (!_isValidEmail(text)) {
        _errors[fieldName] = 'Enter a valid email (e.g., user@example.com)';
        notifyListeners();
        return false;
      }
    }
    
    if (fieldName == 'fullname') {
      // Full name validation - minimum 2 characters, only letters and spaces
      if (text.length < 2) {
        _errors[fieldName] = 'Name must be at least 2 characters';
        notifyListeners();
        return false;
      }
      
      // Check if name contains only letters and spaces
      final hasOnlyLettersAndSpaces = RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);
      if (!hasOnlyLettersAndSpaces) {
        _errors[fieldName] = 'Name can only contain letters and spaces';
        notifyListeners();
        return false;
      }
    }
    
    // Username or Email validation
    if (fieldName == 'usernameoremail') {
      if (text.contains('@')) {
        if (!_isValidEmail(text)) {
          _errors[fieldName] = 'Enter a valid email (e.g., user@example.com)';
          notifyListeners();
          return false;
        }
      } else {
        // Username validation - minimum 3 characters
        if (text.length < 3) {
          _errors[fieldName] = 'Username must be at least 3 characters';
          notifyListeners();
          return false;
        }
      }
    }
    
    // Password validation
    if (fieldName == 'password' || fieldName == 'confirmpassword') {
      if (!_isValidPassword(text)) {
        _errors[fieldName] = 'Password must be 8+ chars with letter, number & special char (@, #, etc.)';
        notifyListeners();
        return false;
      }
    }
    
    // Passcode validation
    if (fieldName == 'passcode') {
      if (!_isValidPasscode(text)) {
        _errors[fieldName] = 'Password must be 8+ chars with letter, number & special char (@, #, etc.)';
        notifyListeners();
        return false;
      }
    }
    
    _errors[fieldName] = null;
    notifyListeners();
    return true;
  }

  // NEW: Validate external controller
  bool validateExternalField(String fieldName, String value) {
    // Check if field is empty
    if (value.trim().isEmpty) {
      _errors[fieldName] = _getEmptyFieldMessage(fieldName);
      notifyListeners();
      return false;
    }
    
    final text = value.trim();
    
    // Email address validation
    if (fieldName == 'emailaddress') {
      if (!_isValidEmail(text)) {
        _errors[fieldName] = 'Enter a valid email (e.g., user@example.com)';
        notifyListeners();
        return false;
      }
    }
    
    if (fieldName == 'fullname') {
      if (text.length < 2) {
        _errors[fieldName] = 'Name must be at least 2 characters';
        notifyListeners();
        return false;
      }
      
      final hasOnlyLettersAndSpaces = RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);
      if (!hasOnlyLettersAndSpaces) {
        _errors[fieldName] = 'Name can only contain letters and spaces';
        notifyListeners();
        return false;
      }
    }
    
    // Username or Email validation
    if (fieldName == 'usernameoremail') {
      if (text.contains('@')) {
        if (!_isValidEmail(text)) {
          _errors[fieldName] = 'Enter a valid email (e.g., user@example.com)';
          notifyListeners();
          return false;
        }
      } else {
        if (text.length < 3) {
          _errors[fieldName] = 'Username must be at least 3 characters';
          notifyListeners();
          return false;
        }
      }
    }
    
    // Password validation
    if (fieldName == 'password' || fieldName == 'confirmpassword') {
      if (!_isValidPassword(text)) {
        _errors[fieldName] = 'Password must be 8+ chars with letter, number & special char (@, #, etc.)';
        notifyListeners();
        return false;
      }
    }
    
    // Passcode validation
    if (fieldName == 'passcode') {
      if (!_isValidPasscode(text)) {
        _errors[fieldName] = 'Password must be 8+ chars with letter, number & special char (@, #, etc.)';
        notifyListeners();
        return false;
      }
    }
    
    _errors[fieldName] = null;
    notifyListeners();
    return true;
  }

  // Additional method to validate all fields at once
  bool validateAllFields(List<String> fieldNames) {
    bool allValid = true;
    for (String fieldName in fieldNames) {
      if (!validateField(fieldName)) {
        allValid = false;
      }
    }
    return allValid;
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}