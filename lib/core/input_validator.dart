class InputValidator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'nama wajib diisi!';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi!';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid!';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi!';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter!';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password wajib diisi!';
    }
    if (value != password) {
      return 'Password tidak cocok!';
    }
    return null;
  }
}

