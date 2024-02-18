import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:zena/http_method/http_method.dart';

class NotfactionController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print('1');
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print('2');
    print(receivedNotification.title);
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print('3');
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print('4');
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    print('5');
  }
}
