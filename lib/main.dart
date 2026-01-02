import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Settings/helper/providers.dart';
import 'Settings/utils/p_colors.dart';
import 'Settings/utils/p_pages.dart';
import 'Settings/utils/p_routes.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
 MultiProvider(providers: providers, child: const 
    MyApp()
)
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'NXL',
      theme: ThemeData(
        brightness: Brightness.dark, // ✅ Set brightness first
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,

        // ✅ OPTION 1: Use ColorScheme for proper dark theme
        colorScheme: ColorScheme.dark(
          primary: PColors.primaryColor,
          secondary: PColors.secondaryColor,
          surface: PColors.scaffoldColor, // This sets the scaffold background
          background: PColors.scaffoldColor,
        ),

        // ✅ OR OPTION 2: Explicitly set scaffold background (this works too)
        scaffoldBackgroundColor: PColors.scaffoldColor,

        iconTheme: IconThemeData(color: PColors.colorFFFFFF),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: PColors.color000000, // Black background
          surfaceTintColor: Colors.transparent, // Prevents Material 3 tint
          foregroundColor: Colors.white, // Title + icons color
          iconTheme: const IconThemeData(
            color: Colors.white, // Back icon color
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
      ),
      initialRoute: PPages.splash,
      onGenerateRoute: Routes.genericRoute,
    );
  }
}
