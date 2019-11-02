import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // fOzNvz3NOfs:APA91bH-u-FHqGf4NO_xVEaDfxsiX7z-k_fYd8udj4wRSdUsgXLs-Xmlimx1fLWVTDXEVaHYMTFWSg0HMkEtU6cbFDGTf6atWhV5nrfbdOswKZG-IoK-ifCGYr8NEaAPn_JFH1eer7oF
  initService() async {
    _firebaseMessaging.requestNotificationPermissions();

    String token = await _firebaseMessaging.getToken();

    print(token);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //_showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //_navigateToItemDetail(message);
      },
    );
  }

  Future myBackgroundMessageHandler(Map<String, dynamic> message) {
    
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }
}
