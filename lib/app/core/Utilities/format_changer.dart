import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class FormatChanger {
  static String formatDateTime(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formattedDateTime =
        DateFormat('hh:mm a  MMM d y').format(parsedDateTime);
    return formattedDateTime;
  }

  static String formatDate(String dateTime, String format) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formattedDateTime = DateFormat(format).format(parsedDateTime);
    return formattedDateTime;
  }

  static Color colorFromString(String colorString) {
    final buffer = StringBuffer();
    if (colorString.startsWith('Color(')) {
      final hexColor =
          colorString.replaceAll('Color(0xff', '').replaceAll(')', '');
      buffer.write('ff');
      buffer.write(hexColor);
      return Color(int.parse(buffer.toString(), radix: 16));
    } else {
      throw const FormatException('Invalid color string');
    }
  }

  static Widget htmlText(String msg) {
    return Html(
      data: msg,
      style: {
        "body": Style(
          fontSize: FontSize(12),
          color: Colors.white,
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
        ),
        "p": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          lineHeight: const LineHeight(1.5),
        ),
        "ul": Style(
          margin: Margins.only(top: 0, bottom: 0, left: 16),
          padding: HtmlPaddings.zero,
        ),
        "li": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
        ),
      },
      onLinkTap: (String? url, Map<String, String> attributes, element) async {
        if (url != null) {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }
}
