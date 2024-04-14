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
        cardColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF212121),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 100,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isCollapsed: false,
          errorStyle: const TextStyle(
            color: Color(0xFFF44336),
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
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
