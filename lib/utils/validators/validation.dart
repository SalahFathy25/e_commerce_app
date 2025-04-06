class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^\+?\d{10}$');
    if (!phoneRegExp.hasMatch(phone)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  static String? validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  static String? validateZip(String? zip) {
    if (zip == null || zip.isEmpty) {
      return 'Zip code is required';
    }
    final zipRegExp = RegExp(r'^\d{5}$');
    if (!zipRegExp.hasMatch(zip)) {
      return 'Please enter a valid zip code';
    }
    return null;
  }

  static String? validateCountry(String? country) {
    if (country == null || country.isEmpty) {
      return 'Country is required';
    }
    return null;
  }

  static String? validateCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Card number is required';
    }
    final cardNumberRegExp = RegExp(r'^\d{16}$');
    if (!cardNumberRegExp.hasMatch(cardNumber)) {
      return 'Please enter a valid card number';
    }
    return null;
  }
}
