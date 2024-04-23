import 'package:sportion/library.dart';

class ThemeRepository {
  static OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
        ),
      );

  static ThemeData get theme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.deepPurple,
          secondary: const Color.fromARGB(255, 193, 185, 214),
          surface: Colors.grey[350],
          onSurface: const Color(0xFF1C1B1F),
          seedColor: Colors.deepPurple,
          error: Colors.grey[350],
        ),
        cardColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[350],
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          toolbarHeight: 100,
          iconTheme: IconThemeData(
            color: Colors.grey[350],
          ),
          titleTextStyle: TextStyle(
            color: Colors.grey[350],
            fontSize: 20,
          ),
          toolbarTextStyle: TextStyle(
            color: Colors.grey[350],
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          displayMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          headlineMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          headlineSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          titleLarge: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1B1F),
          ),
          titleMedium: TextStyle(fontSize: 16.0, color: Colors.white),
          titleSmall: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF1C1B1F),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isCollapsed: false,
          errorStyle: const TextStyle(
            color: Color(0xFFF44336),
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF1C1B1F),
            fontSize: 16,
          ),
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          filled: true,
          fillColor: Colors.deepPurple.withOpacity(.2),
          contentPadding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
        ),
      );

  static ThemeMode get themeMode => ThemeMode.dark;
}
