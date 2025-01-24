import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toasts {
  static void showSuccess(String message, {String? title}) {
    _show(message, Colors.green, Icons.check_circle, title: title ?? 'Success');
  }

  static void showError(String message, {String? title}) {
    _show(message, Colors.red, Icons.error, title: title ?? 'Error');
  }

  static void showInfo(String message, {String? title}) {
    _show(message, Colors.blue, Icons.info, title: title ?? 'Information');
  }

  static void _show(
    String message,
    Color color,
    IconData icon, {
    required String title,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.closeCurrentSnackbar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(message),
                ],
              ),
            ),
          ],
        ),
        duration: duration,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  static void close() {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  }
}


///
///
///
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Toasts {
//   static void showSuccess(String message, {String? title}) {
//     _show(message, Colors.green, Icons.check_circle, title: title ?? 'Success');
//   }

//   static void showError(String message, {String? title}) {
//     _show(message, Colors.red, Icons.error, title: title ?? 'Error');
//   }

//   static void showInfo(String message, {String? title}) {
//     _show(message, Colors.blue, Icons.info, title: title ?? 'Information');
//   }

//   static void _show(
//     String message,
//     Color color,
//     IconData icon, {
//     required String title,
//     Duration duration = const Duration(seconds: 3),
//   }) {
//     Get.closeCurrentSnackbar();
//     Get.snackbar(
//       title,
//       message,
//       snackPosition: SnackPosition.TOP,
//       backgroundColor: color.withOpacity(0.8),
//       colorText: Colors.white,
//       icon: Icon(icon, color: Colors.white),
//       duration: duration,
//       isDismissible: true,
//       borderRadius: 8,
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     );
//   }

//   static void close() {
//     if (Get.isSnackbarOpen) {
//       Get.closeCurrentSnackbar();
//     }
//   }
// }
