import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  var lastMessage = "Waiting for messages...".obs;
  var token = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
    _initLocalNotifications();
  }

  Future<void> _initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _localNotifications.initialize(initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      Get.snackbar("Opened Notification", response.payload ?? "No message");
    });
  }

  Future<void> _initFCM() async {
    NotificationSettings settings = await _messaging.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    token.value = await _messaging.getToken() ?? "No token";
    print("📱 Token: ${token.value}");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final title = message.notification?.title ?? 'No title';
      final body = message.notification?.body ?? 'No body';

      lastMessage.value = "$title\n$body";
      print("📨 Foreground message: $title");

      Get.snackbar(title, body, snackPosition: SnackPosition.TOP);

      await _showLocalNotification(title, body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'Opened';
      final body = message.notification?.body ?? 'No body';

      lastMessage.value = "$title\n$body";
      Get.snackbar("Opened Notification", "$title\n$body",
          snackPosition: SnackPosition.TOP);
    });
  }

  Future<void> _showLocalNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel', 
      'General Notifications', 
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0, 
      title,
      body,
      details,
      payload: body,
    );
  }
}
