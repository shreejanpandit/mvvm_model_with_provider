import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFF239DE9);
  static const Color secondaryColor = Color(0xFF2CABDD);
  static const Color otherColor1 = Color(0xFF014011);
  static const Color otherColor2 = Color(0xFFF2B705);
  static const Color otherColor3 = Color(0xFFF29F05);

  static final TextStyle xSmall = GoogleFonts.poppins(
    fontSize: 12.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle small = GoogleFonts.poppins(
    fontSize: 14.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle base = GoogleFonts.poppins(
    fontSize: 16.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle h1 = GoogleFonts.poppins(
    fontSize: 84.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h2 = GoogleFonts.poppins(
    fontSize: 76.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h3 = GoogleFonts.poppins(
    fontSize: 60.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h4 = GoogleFonts.poppins(
    fontSize: 48.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h5 = GoogleFonts.poppins(
    fontSize: 36.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h6 = GoogleFonts.poppins(
    fontSize: 24.0,
    height: 1.0,
    color: Colors.black,
  );

  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: base,
      headline1: h1,
      headline2: h2,
      headline3: h3,
      headline4: h4,
      headline5: h5,
      headline6: h6,
      subtitle1: small,
      subtitle2: xSmall,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      color: primaryColor,
      toolbarTextStyle: h6.copyWith(
        color: Colors.white,
      ),
      titleTextStyle: h6.copyWith(color: Colors.white),
    ),
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello World',
              style: CustomTheme.base,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {},
              child: Text(
                'Button',
                style: CustomTheme.base.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
