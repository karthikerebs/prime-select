import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final RxList<NotificationItem> notifications = <NotificationItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load notifications
    loadNotifications();
  }

  void loadNotifications() {
    // Add dummy notifications for testing
    notifications.addAll([
      NotificationItem(
        title: 'Title',
        message:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
        timestamp: DateTime.now(),
      ),
      NotificationItem(
        title: 'Title',
        message:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
        timestamp: DateTime.now(),
      ),
    ]);
  }

  void clearAllNotifications() {
    notifications.clear();
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}
