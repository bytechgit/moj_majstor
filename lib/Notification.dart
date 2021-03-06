import 'dart:async';
import 'dart:developer';

import 'package:bitmap/bitmap.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(
      '----------------------------------------------------------------------------');
}

class Notification {
  static final Notification _instance = Notification._internal();

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static String? _token;
  late StreamSubscription<RemoteMessage> onMessageSubscription;
  Hmac hmacSha256 =
      Hmac(sha256, utf8.encode("MfgR78fS7FSAh78FSAUJi8FSU895H9Lo"));

  factory Notification() {
    return _instance;
  }

  Notification._internal() {
    initFirebase();
  }

  Future<void> initFirebase() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _loadFCM();
    await _getFCMToken();
    await _listenFCM();
    print("TOKEN: " + (_token ?? ""));
    //subscribeToChannel("Testing");
    subscribeDevice("Krstaa");
    /*sendMessagetoUser(
        "1q0SMGMEvrddmMdxUc6CD4xArxQ2",
        "Krstaa",
        "Naslov",
        "Poruka",
        "https://lh3.googleusercontent.com/ogw/ADea4I5QE6YC4BVEVAdwwNyA50IVvir9dNDgkrnFNVw-gQ=s32-c-mo");*/
    // unSubscribeDevice("Krstaa");
  }

  void dispose() {
    onMessageSubscription.cancel();
  }

  static subscribeToChannel(String channel) {
    FirebaseMessaging.instance.subscribeToTopic(channel);
  }

  static unsubscribeToChannel(String channel) {
    FirebaseMessaging.instance.unsubscribeFromTopic(channel);
  }

  Future<void> _listenFCM() async {
    //onforeground

    onMessageSubscription =
        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      Bitmap bitmap = await Bitmap.fromProvider(const NetworkImage(
          'https://lh3.googleusercontent.com/ogw/ADea4I5QE6YC4BVEVAdwwNyA50IVvir9dNDgkrnFNVw-gQ=s32-c-mo'));
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            //ovde hvata notifikacije u aplikaciji
            android: AndroidNotificationDetails(channel.id, channel.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'app_icon',
                playSound: true,
                //  sound: const RawResourceAndroidNotificationSound(
                //    'notification_sound'),
                enableLights: true,
                ledColor: Colors.orange,
                ledOnMs: 100,
                ledOffMs: 100,
                color: Colors.orange,
                colorized: true,
                largeIcon: bitmap.buildImage() as AndroidBitmap<
                    Object>), //'https://lh3.googleusercontent.com/ogw/ADea4I5QE6YC4BVEVAdwwNyA50IVvir9dNDgkrnFNVw-gQ=s32-c-mo'),
          ),
        );
      }
    });
  }

  Stream<String> onTokenRefresh() => FirebaseMessaging.instance.onTokenRefresh;

  Future<void> _loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title+
          importance: Importance.high,
          enableVibration: true,
          playSound: true,
          // sound: RawResourceAndroidNotificationSound('notification_sound'),
          showBadge: true,
          enableLights: true,
          ledColor: Colors.orange);

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      //const AndroidInitializationSettings initializationSettingsAndroid =
      //  AndroidInitializationSettings('app_icon');

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> _getFCMToken() async {
    _token = await FirebaseMessaging.instance.getToken();
  }

  Future<void> subscribeDevice(String uid) async {
    String body = jsonEncode(<String, dynamic>{
      "uid": uid,
      "deviceid": _token,
    });
    var digest = hmacSha256.convert(utf8.encode(body));
    try {
      await http
          .post(
            Uri.parse(
                'https://notificationservicebytech.azurewebsites.net/subscribeDevice'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'securetoken': digest.toString(),
            },
            body: body,
          )
          .then((http.Response value) => print("IZLAZ: " + value.body));

      print('FCM request for channel sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> unSubscribeDevice(String uid) async {
    String body = jsonEncode(<String, dynamic>{
      "uid": uid,
      "deviceid": _token,
    });
    var digest = hmacSha256.convert(utf8.encode(body));
    try {
      await http
          .post(
            Uri.parse(
                'https://notificationservicebytech.azurewebsites.net/unSubscribeDevice'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'securetoken': digest.toString(),
            },
            body: body,
          )
          .then((http.Response value) => print("IZLAZ: " + value.body));

      print('FCM request for channel sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessagetoUser(String senderUID, String recieverUID,
      String title, String message, String image) async {
    String body = jsonEncode(<String, dynamic>{
      "sender": senderUID,
      "reciever": recieverUID,
      "title": title,
      "message": message,
      "image": image
    });
    var digest = hmacSha256.convert(utf8.encode(body));
    try {
      await http
          .post(
            Uri.parse(
                'https://notificationservicebytech.azurewebsites.net/sendMessageToUser'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'securetoken': digest.toString(),
            },
            body: body,
          )
          .then((http.Response value) => print("IZLAZ: " + value.body));

      print('FCM request for channel sent!');
    } catch (e) {
      print(e);
    }
  }
}
