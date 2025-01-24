class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? bloodGroupValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Blood group is required';
    }
    final validBloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    if (!validBloodGroups.contains(value.toUpperCase())) {
      return 'Please enter a valid blood group (e.g., A+, B-, AB+, O-)';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? mobilenumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number is required';
    }
    if (!isNumeric(value) || value.length != 10) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? moneyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final RegExp moneyRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!moneyRegex.hasMatch(value)) {
      return 'Please enter a valid amount';
    }
    return null;
  }

  static String? emailOrNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email or number is required';
    }
    final bool isValidEmail = emailValidator(value) == null;
    final bool isValidNumber = mobilenumberValidator(value) == null;
    if (!isValidEmail && !isValidNumber) {
      return 'Enter a valid email address or number';
    }
    return null;
  }

  static bool isNumeric(String value) {
    if (value.isEmpty) {
      return false;
    }
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(value);
  }

  static String? vehicleNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle number is required';
    }
    value = value.toUpperCase();
    final RegExp vehicleNumberRegex = RegExp(r'^KL\d{1,2}[A-Z]{1,2}\d{1,4}$');
    if (!vehicleNumberRegex.hasMatch(value)) {
      return 'Enter a valid vehicle number (e.g., KL01AB1234 or KL54F7865)';
    }
    return null;
  }

  // New Validators
  static String? yearValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Year is required';
    }
    final int? year = int.tryParse(value);
    if (year == null || year < 1900 || year > DateTime.now().year) {
      return 'Enter a valid year';
    }
    return null;
  }

  static String? kmDrivenValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'KM Driven is required';
    }
    final RegExp kmRegex = RegExp(r'^\d+$');
    if (!kmRegex.hasMatch(value)) {
      return 'Enter a valid number of kilometers';
    }
    return null;
  }

  static String? numberOfOwnersValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number of owners is required';
    }
    final int? numberOfOwners = int.tryParse(value);
    if (numberOfOwners == null || numberOfOwners < 0 || numberOfOwners >= 10) {
      return 'Enter a valid number of owners (0-9)';
    }
    return null;
  }

  // total land area n cents
  static String? validateLandArea(String? value) {
    // if (value == null || value.isEmpty) {
    //   return 'Please enter the land area';
    // }

    final landArea = double.tryParse(value!);
    if (landArea == null) {
      return 'Please enter a valid number';
    }

    if (landArea <= 1) {
      return 'Land area must be greater than one cent';
    }

    if (landArea > 10000) {
      return 'Land area cannot exceed 10000 cents';
    }

    return null;
  }

  // super builtup area
  static String? validateSuperBuiltupArea(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the total area in square feet';
    }

    final area = double.tryParse(value);
    if (area == null) {
      return 'Please enter a valid number';
    }

    if (area < 50) {
      return 'Area cannot be less than 50 ft²';
    }

    if (area > 10000) {
      return 'Area cannot exceed 10,000 ft²';
    }

    return null;
  }

  // carpet area
  static String? validateCarpetArea(String? value, String superBuiltupAreaStr) {
    if (value == null || value.isEmpty) {
      return 'Please enter the net usable area in square feet';
    }

    final carpetArea = double.tryParse(value);
    final superBuiltupArea = double.tryParse(superBuiltupAreaStr);

    if (carpetArea == null) {
      return 'Please enter a valid number for Carpet Area';
    }

    if (superBuiltupArea == null) {
      return 'Please enter a valid number for Super Builtup Area';
    }

    if (carpetArea < 50) {
      return 'Carpet area cannot be less than 50 ft²';
    }

    if (carpetArea > 10000) {
      return 'Carpet area cannot exceed 10,000 ft²';
    }

    if (carpetArea >= superBuiltupArea) {
      return 'Carpet area should be less than Super Builtup Area';
    }

    return null; // Input is valid
  }

  // ad title
  static String? validateAdTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an Ad Title';
    }

    if (value.length < 10) {
      return 'A minimum length of 10 characters is required. Please edit the field.';
    }

    return null;
  }

  // describe something
  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please describe what you are selling';
    }

    if (value.length < 10) {
      return 'A minimum length of 10 characters is required. Please edit the field.';
    }
    return null;
  }

  // price
  static String? validateSellingPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the total selling price';
    }

    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid number';
    }

    if (price < 50000) {
      return 'Price must be at least 50,000';
    }

    if (price > 100000000) {
      return 'Price cannot exceed 100,000,000';
    }

    return null;
  }

  // maintenance
  static String? validateMaintenance(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    final price = double.tryParse(value);

    if (price! < 100) {
      return 'Maintenance cost must be at least 100';
    }

    if (price > 30000) {
      return 'Maintenance cost cannot exceed 30,000';
    }
    return null;
  }

  // security amount
  static String? validateSecurityAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Security Amount if any, else enter 0 ';
    }

    final amount = double.tryParse(value);

    if (amount! < 0) {
      return 'Security amount cannot be negative';
    }
    if (amount > 5000000) {
      return 'Security amount cannot exceed 5,000,000';
    }
    return null;
  }

  // monthly rent
  static String? validateMonthlyRent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the monthly rent amount';
    }
    final rent = double.tryParse(value);
    if (rent == null) {
      return 'Please enter a valid number';
    }
    if (rent < 100) {
      return 'Monthly rent must be at least 100';
    }
    if (rent > 1000000) {
      return 'Monthly rent cannot exceed 1,000,000';
    }
    return null;
  }

  // plot area
  static String? validatePlotArea(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the plot area in cents';
    }

    final area = double.tryParse(value);
    if (area == null) {
      return 'Please enter a valid number';
    }

    if (area < 1) {
      return 'Plot area must be at least 1 cent';
    }

    if (area > 9999999) {
      return 'Plot area cannot exceed 9,999,999 cents';
    }
    return null;
  }

  static String? validateLink(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid link';
    }
    final RegExp linkRegex = RegExp(r'^https?://\S+$');
    if (!linkRegex.hasMatch(value)) {
      return 'Please enter a valid link';
    }
    return null;
  }

  static String? validateSocialMedia(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a social media';
    }
    return null;
  }

  static String? validateAadhaarLastFour(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the last 4 digits of your Aadhaar number';
    }
    if (value.length != 4) {
      return 'Please enter exactly 4 digits';
    }
    if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
      return 'Please enter only digits';
    }
    return null;
  }

  static String? validatePANNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your PAN number';
    }
    if (value.length != 10) {
      return 'PAN number must be 10 characters long';
    }
    if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
      return 'Please enter a valid PAN number';
    }
    return null;
  }
}
