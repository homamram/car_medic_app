import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_medic/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'notifi_channel',
              channelKey: 'notifi',
              channelName: 'Basic notification',
              channelDescription: 'channel basic test',
              defaultColor: AppColors.mainColor,
              ledColor: AppColors.whiteColor,
              importance: NotificationImportance.Max,
              channelShowBadge: true,
              onlyAlertOnce: true,
              playSound: true,
              criticalAlerts: true)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'notifi_channel', channelGroupName: 'Group 1')
        ],
        debug: true);
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod);
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('onNotificationCreatedMethod');
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] == 'true') {
      Get.to(() => MainView(currentIndex: 2));
      HomeViewController controller = Get.find();
      controller.showDialogExpandTime();
    }
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool schedual = false,
    final int? interval,
  }) async {
    assert(!schedual || (schedual && interval != null));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            channelKey: 'notifi',
            title: title,
            body: body,
            actionType: actionType,
            notificationLayout: notificationLayout,
            summary: summary,
            category: category,
            payload: payload,
            bigPicture: bigPicture),
        actionButtons: actionButtons,
        schedule: schedual
            ? NotificationInterval(
                interval: interval,
                timeZone:
                    await AwesomeNotifications().getLocalTimeZoneIdentifier(),
                preciseAlarm: true)
            : null);
  }
}
