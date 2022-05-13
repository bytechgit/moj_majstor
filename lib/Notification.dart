import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
//import 'package:oauth2_client/access_token_response.dart';

//import 'package:oauth2_client/google_oauth2_client.dart';
//import 'package:oauth2_client/oauth2_client.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(
      '----------------------------------------------------------------------------');
  // print('Handling a background message ${jsonEncode(message.notification)}');
}

class Notification {
  static final Notification _instance = Notification._internal();

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static String? _token;

  factory Notification() {
    return _instance;
  }

  Notification._internal() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _requestPermission();
    _loadFCM();
    _listenFCM();

    _getFCMToken().then((token) {
      print(_token);
    });

    subscribeToChannel("Testing");

    //_getOAuth2Token();
  }

  static _getOAuth2Token() async {
    // OAuth2Client googleClient = GoogleOAuth2Client(
    //     redirectUri:
    //         'https://www.getpostman.com/oauth2/callback', //Just one slash, required by Google specs
    //     customUriScheme: 'moj-majstor-a2658');

    // AccessTokenResponse tknResp = await googleClient.getTokenWithAuthCodeFlow(
    //     clientId:
    //         '206265439348-s5ajde7ckopc9koe9ibmnmtbcr1fn6qa.apps.googleusercontent.com', //Your client id
    //     clientSecret: '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', //Your client secret
    //     scopes: [
    //       'https://www.googleapis.com/auth/firebase.messaging'
    //     ] //Optional
    //     );
    // print(tknResp.error);
  }

  static subscribeToChannel(String channel) {
    FirebaseMessaging.instance.subscribeToTopic(channel);
  }

  static unsubscribeToChannel(String channel) {
    FirebaseMessaging.instance.unsubscribeFromTopic(channel);
  }

  void _listenFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            //ovde hvata notifikacije u aplikaciji
            android: AndroidNotificationDetails(
              channel.id, channel.name,
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
            ),
          ),
        );
      }
    });
  }

  Future<void> _loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title
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

  static Future<void> sendToDevice(
      {String? token, String? body, String? title}) async {
    _sendMessage(reciever: token, body: body, title: title);
  }

  static Future<void> sendToChannel(
      {String? channel, String? title, String? body}) async {
    _sendMessage(reciever: '/topics/$channel', body: body, title: title);
  }

  /*static Future<void> _sendMessageV1(
      {String? reciever,
      String? body,
      String? title,
      required bool isTopic}) async {
    if (reciever == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      // print(await FirebaseAuth.instance.currentUser!.getIdToken());
      await http
          .post(
            Uri.parse(
                'https://fcm.googleapis.com/v1/projects/moj-majstor-a2658/messages:send'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ' +
                  "ya29.A0ARrdaM9yvmjOEEhrpzjWJYlc28WpHZrCGwGvAzpZNMfgUCGGwxUMmDks5dKSiVQ3Mo5JZGgZpOHSzdwPPWkiBv5AyEL3guGny0SIsWz15v50ncclCg7WcbGu7hlwMtboBFSkHxX0nDt6-dACWNoXojMMuR54",
              //    'eyJhbGciOiJSUzI1NiIsImtpZCI6ImFhZmE4MTJiMTY5NzkxODBmYzc4MjA5ZWE3Y2NhYjkxZTY4NDM2NTkiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2FzYSBTdG9qaWxqa292aWMiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2dXS0JobGZDVjgxZGEzNW5YS2ZVUGhMQnByR0t1b0xJdktZQVZHMFE9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbW9qLW1hanN0b3ItYTI2NTgiLCJhdWQiOiJtb2otbWFqc3Rvci1hMjY1OCIsImF1dGhfdGltZSI6MTY1MDI4NjcxNCwidXNlcl9pZCI6ImFGbk53QnZpT1NTbGpyS0YzZHRqcmhpcVF3NDMiLCJzdWIiOiJhRm5Od0J2aU9TU2xqcktGM2R0anJoaXFRdzQzIiwiaWF0IjoxNjUwMjg2NzE0LCJleHAiOjE2NTAyOTAzMTQsImVtYWlsIjoic2dzc2FzYUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwODM1MDE1MzQ1Nzg3ODUxODYxMyJdLCJlbWFpbCI6WyJzZ3NzYXNhQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.X4mqu4a6W7Mhha_oc35xsAHaVtd5ZlD63OLICGXp6JkI1dyT24WHMxMmeGU5baJiIWetZayp5jdilslBc-DJq3JhQel9hngdAlAu3MXFkPAizHy_sajTU7WhVzlafoZfyICNsrpF7Y8wOmLSAMn8OHSZa7Dew1W_W3s3HtN3dp679hn10S17LjD9LlUh6f6VjzUzu9YupSLp-jJP8suFlklB',
              //'ya29.A0ARrdaM-96u5xrnqXjLWwATzWTaGGhuEmWZ6Cg9EPHdNcRSlnCypSWkLdA2FprZSVhHhohMqMNDq-2KsDI_Xp5vqmu_Ck-W7eJBcZi1dq0UNfA8c-nRi0_SfLPL9QzySZzb5jQ9FHGecxOFehXMTmJR9d_h4f',
            },
            body: jsonEncode(<String, dynamic>{
              "message": {
                "notification": {
                  "title": " up 1.43% on the day",
                  "body":
                      'FooCorp gained 11.80 points to close at 835.67, up 1.43% on the day.'
                },
                "android": {
                  "notification": {
                    "icon": 'app_icon',
                    "color": '#7e55c3',
                    "image":
                        "https://lh3.googleusercontent.com/ogw/ADea4I5Z-pEWkfhAeASbHku2-CH_sG5H1QWZc36rvtUJ=s64-c-mo",
                    // "sound": "notification_sound",
                    //"light_on_duration": "1000",
                    //"light_off_duration": "1000",
                  }
                },
                isTopic ? "topic" : "to": reciever,
              }
            }),
          )
          .then((http.Response value) => print(value.body));
      print('FCM request for channel sent!');
    } catch (e) {
      print(e);
    }
  }*/

  static Future<void> _sendMessage(
      {String? reciever, String? body, String? title}) async {
    if (reciever == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http
          .post(
            Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':
                  "key=AAAAMAZg1HQ:APA91bH7zI_5e_aIb2Cx8xUYI_u7rDZVOqxp7KGn2OcWTPkV8yC0ekfRQpX0sR9NMH5jrpMHfIEO3yDKZ8DELOvWva9FSkSEDqgOjk7ovnmUsNEYIqpDwn-rqwgSGO78VnY0vLnFIM2c",
            },
            body: jsonEncode(<String, dynamic>{
              "notification": <String, dynamic>{
                "icon": "app_icon",
                "body": body ?? "No message",
                "title": title ??
                    "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                "image":
                    "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"
              },
              'priority': 'high',
              // 'click_action': "FLUTTER_NOTIFICATION_CLICK",
              "data": <String, dynamic>{'id': '1', 'status': 'done'},
              "to": reciever //ovde se menja na id
            }),
          )
          .then((http.Response value) => print(value.body));

      print('FCM request for channel sent!');
    } catch (e) {
      print(e);
    }
  }
}
