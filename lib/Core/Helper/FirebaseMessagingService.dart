import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingHelper {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void initialize() async {
    await requestPermission();
    listenToForegroundMessages();
    setupBackgroundMessageHandler();
    logToken();
  }

  Future<String?> logToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("Device Token: $token");
    return token; // ✅ Return the token instead of void
  }

  Future<void> requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  void listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Forground >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  @pragma('vm:entry-point')
  static void setupBackgroundMessageHandler() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // await Firebase.initializeApp();

    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Oussama Background >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(message.data);
  }
}
