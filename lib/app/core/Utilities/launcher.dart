import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:omiga/app/core/Utilities/toasts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class LaunchUrl {
  static Future<void> launchURL(String url) async {
    HapticFeedback.lightImpact();
    if (url.isEmpty) {
      Toasts.showError('Unable to open link. Please try again later.');
      return;
    } else if (url.contains('http')) {
      final Uri uri = Uri.parse(url);
      try {
        if (!await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
          webOnlyWindowName: '_blank',
        )) {
          throw 'Could not launch $url';
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error launching URL: $e');
        }
        Toasts.showError('Unable to open link. Please try again later.');
        log('Error launching URL: $url. Error: $e');
      }
    } else {
      Toasts.showError('Unable to open link. Please try again later.');
    }
  }
}
