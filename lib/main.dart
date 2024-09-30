import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'screens/report_issue_screen.dart'; // Make sure to import your report issue screen

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages here
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  runApp(TakaApp());
}

class TakaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAKA App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('sw', ''), // Swahili
        // Add other local languages here
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          // Using displaySmall for general text
          displaySmall: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Background color
            foregroundColor: Colors.white, // Text color
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          ),
        ),
      ),
      home: ReportIssueScreen(),
    );
  }
}
