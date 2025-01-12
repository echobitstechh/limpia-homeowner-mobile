
import 'package:limpia/core/utils/config.dart';
import 'package:limpia/core/utils/local_store_dir.dart';
import 'package:limpia/core/utils/local_stotage.dart';
import 'package:limpia/state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:limpia/app/app.bottomsheets.dart';
import 'package:limpia/app/app.dialogs.dart';
import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.router.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:update_available/update_available.dart';
import 'package:workmanager/workmanager.dart';
//import 'app/flutter_paystack/lib/flutter_paystack.dart';
import 'firebase_options.dart';
import 'package:rxdart/rxdart.dart';

/// @author George David
/// email: georgequin19@gmail.com
/// Feb, 2024
///

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _messageStreamController = BehaviorSubject<RemoteMessage>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // initializeNotifications();
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  // Initialize Paystack with your public key
  //final  paystackPlugin = PaystackPlugin();
  //await paystackPlugin.initialize(publicKey: AppConfig.paystackApiKeyTest);





  //final messaging = FirebaseMessaging.instance;

  // final settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  //
  // messaging.setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true);
  //
  // if (kDebugMode) {
  //   print('Permission granted: ${settings.authorizationStatus}');
  // }
  //
  // String? token = await messaging.getToken();
  // print('firebase device token is: $token');
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (kDebugMode) {
  //     print('Handling a foreground message: ${message.messageId}');
  //     print('Message data: ${message.data}');
  //     print('Message notification: ${message.notification?.title}');
  //     print('Message notification: ${message.notification?.body}');
  //   }
    // String messageType = message.data['type'] ?? '';
    //
    // if (messageType == 'text') {
    //  displayTextNotification(message.notification?.title ?? '', message.notification?.body ?? '');
    // } else if (messageType == 'image') {
    //   displayImageNotification(message.data);
    // }

  //   _messageStreamController.sink.add(message);
  // });
 // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());

}

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/launcher_icon');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid, );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse? response) async {
      await onSelectNotification(response?.payload);
    },
  );
}


Future<void> onSelectNotification(String? payload) async {
  if (payload != null) {
    // Handle notification click
    print('Notification clicked with payload: $payload');
  }
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }

  // // Check the message type
  // String messageType = message.data['type'] ?? '';
  // if (messageType == 'text') {
  //   displayTextNotification(message.notification?.title ?? '', message.notification?.body ?? '');
  // } else if (messageType == 'image') {
  //   displayImageNotification(message.data);
  // }
}

void displayTextNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'lIMP2024',
    'Limpia',
    channelDescription: 'your_channel_description',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: 'item x',
  );
}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    fetchUiState();
    checkForUpdates();
    super.initState();
  }

  void fetchUiState() async {
    String? savedMode =
        await locator<LocalStorage>().fetch(LocalStorageDir.uiMode);
    if (savedMode != null) {
      switch (savedMode) {
        case "light":
          uiMode.value = AppUiModes.light;
          break;
        case "dark":
          uiMode.value = AppUiModes.dark;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppUiModes>(
      valueListenable: uiMode,
      builder: (context, value, child) => MaterialApp(
        title: 'limpia',
        // theme: value == AppUiModes.dark ? darkTheme() : lightTheme(),
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: value == AppUiModes.dark ? ThemeMode.dark : ThemeMode.light,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: kcWhiteColor,
        ),
        iconTheme: const IconThemeData(color: kcWhiteColor),
        toolbarTextStyle: const TextStyle(color: kcWhiteColor),
        elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      brightness: Brightness.dark,
      primaryColor: kcBackgroundColor,
      focusColor: kcPrimaryColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: kcWhiteColor),
    );
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: kcBlackColor,
        ),
        iconTheme: const IconThemeData(color: kcBlackColor),
        toolbarTextStyle: const TextStyle(color: kcBlackColor),
        backgroundColor: kcWhiteColor,
        elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      primaryColor: kcBackgroundColor,
      focusColor: kcPrimaryColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: kcBlackColor),
    );
  }

  void checkForUpdates() async {
    final availability = await getUpdateAvailability();
    if (availability is UpdateAvailable) {
      showUpdateCard();
    }
  }

  void showUpdateCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/update.svg',
                  height: 10,
                ),
                const ListTile(
                  title: Text('App Updates', style: TextStyle(fontSize: 12,
                    fontFamily: "Panchang", fontWeight: FontWeight.bold,)),
                  subtitle: Text('A new version of Limpia is now available.'
                      ' download now to enjoy our lastest features.', style: TextStyle(fontSize: 8,
                    fontFamily: "Panchang",)),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        // Add logic to navigate to the store or perform the update
                      },
                      child: const Text('Update Now'),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pop(context); // Close the dialog
                    //   },
                    //   child: Text('Later'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
