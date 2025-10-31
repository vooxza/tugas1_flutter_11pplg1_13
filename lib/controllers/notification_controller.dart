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

  // 🔧 Setup local notifications
  Future<void> _initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _localNotifications.initialize(initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      // Jika user klik notifikasi → tampil snackbar info
      Get.snackbar("Opened Notification", response.payload ?? "No message");
    });
  }

  // 🔧 Setup Firebase Cloud Messaging
  Future<void> _initFCM() async {
    // Request permission
    NotificationSettings settings = await _messaging.requestPermission();
    print("🔔 Permission: ${settings.authorizationStatus}");

    // Get token
    token.value = await _messaging.getToken() ?? "No token";
    print("📱 Token: ${token.value}");

    // Foreground message listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final title = message.notification?.title ?? 'No title';
      final body = message.notification?.body ?? 'No body';

      lastMessage.value = "$title\n$body";
      print("📨 Foreground message: $title");

      // ✅ Tampilkan snackbar
      Get.snackbar(title, body, snackPosition: SnackPosition.TOP);

      // ✅ Tampilkan notifikasi sistem (tray)
      await _showLocalNotification(title, body);
    });

    // Jika app dibuka dari background via klik notifikasi
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'Opened';
      final body = message.notification?.body ?? 'No body';

      lastMessage.value = "$title\n$body";
      Get.snackbar("Opened Notification", "$title\n$body",
          snackPosition: SnackPosition.TOP);
    });
  }

  // 🧩 Fungsi tampilkan notifikasi lokal
  Future<void> _showLocalNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel', // channel id
      'General Notifications', // channel name
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0, // id
      title,
      body,
      details,
      payload: body,
    );
  }
}
