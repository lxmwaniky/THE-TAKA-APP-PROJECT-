import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../i18n/localization.dart';
import 'rating_system.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ReportIssueScreen extends StatefulWidget {
  @override
  _ReportIssueScreenState createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String _selectedLanguage = 'en';
  String _locationMessage = "Location not obtained.";
  XFile? _image;

  @override
  void initState() {
    super.initState();
    requestPermission(); // Request notification permissions on init
    setupFirebaseListeners(); // Set up FCM listeners
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _locationMessage = "Lat: ${position.latitude}, Lon: ${position.longitude}";
      });
    } catch (e) {
      _showSnackbar("Failed to get location.");
      setState(() {
        _locationMessage = "Failed to get location.";
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    } else {
      _showSnackbar("No image selected.");
    }
  }

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void setupFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        _showSnackbar(message.notification!.title ?? 'New Message');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle when the app is opened from a notification
      print('Message clicked!');
      // You can navigate to a specific screen or show a dialog here
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Locale(_selectedLanguage);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('submit', locale)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language selection dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.language, color: Colors.green),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items: [
                    {'code': 'en', 'name': 'English'},
                    {'code': 'sw', 'name': 'Swahili'},
                  ].map<DropdownMenuItem<String>>((Map<String, String> value) {
                    return DropdownMenuItem<String>(
                      value: value['code'],
                      child: Text(value['name']!),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_locationMessage),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            // Add your rating system widget here
            RatingSystem(),
          ],
        ),
      ),
    );
  }
}
