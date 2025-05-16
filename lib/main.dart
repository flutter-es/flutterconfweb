import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_conf_latam/app.dart';
import 'package:flutter_conf_latam/bootstrap.dart';

void main() async {
  await bootstrap(
    () async => FlutterConfApp(),
    // Provide the required FirebaseOptions object as the second argument
    const FirebaseOptions(
      apiKey: 'your-api-key',
      appId: 'your-app-id',
      messagingSenderId: 'your-messaging-sender-id',
      projectId: 'your-project-id',
    ),
  );
}
