import 'package:flutter/material.dart';
class AppTheme {
  static ThemeData lightTheme=ThemeData(
    primaryColor: Colors.purple,
    fontFamily: 'Fira Sans',

    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.purple,
      iconTheme: IconThemeData(
        color: Color(0xFFeee6ff),
        size: 30,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xFFeee6ff),
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'Fira Sans',
      ),
      elevation: 8.0,
      shadowColor: Color(0xffcc99ff),
      scrolledUnderElevation: 8.0,
    ),

    scaffoldBackgroundColor: Color(0xFFeee6ff),

    textTheme: TextTheme(

      titleLarge: TextStyle(
        color: Colors.purple,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.purple,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.purple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle(
        color: Colors.purple,
        fontSize: 40,
      ),
      bodyMedium: TextStyle(
        color: Colors.purple,
        fontSize: 30,
      ),
      bodySmall: TextStyle(
        color: Colors.purple,
        fontSize: 20,
      ),

      labelLarge: TextStyle(
        color: Color(0xFFeee6ff),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      labelMedium: TextStyle(
        color: Colors.purple,
        fontSize: 15,
      ),
      labelSmall: TextStyle(
        color: Colors.red.shade400,
        fontSize: 15,
      ),
      displaySmall: TextStyle(
          color: Colors.red.shade400,
          fontSize: 20,
          fontWeight: FontWeight.w500
      ),
      displayMedium: TextStyle(
        color: Color(0xFFeee6ff),
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      displayLarge: TextStyle(
        color: Color(0xFFeee6ff),
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.purple,
        backgroundColor: Color(0xfff7f2ff),
        side: BorderSide(
          color: Colors.purple,
          width: 0.1,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.purple,
          // alignment: Alignment.centerRight,
        )
    ),

    primaryIconTheme: IconThemeData(
        color: Colors.purple,
        size: 40
    ),

    iconTheme: IconThemeData(
      color: Colors.purple,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      prefixIconColor: Colors.purple,
      suffixIconColor: Colors.purple,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(width: 1,color: Colors.purple),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(width: 1,color: Colors.purple),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.purple)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.red)
      ),
      focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.red)
      ),
    ),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return Colors.purple;
        }
        return Colors.purple;
      }),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.purple.shade200,
          )
      ),
      tileColor: Color(0xFFeee6ff),
      selectedColor: Colors.purple,
      textColor: Colors.purple,
      iconColor: Colors.purple,
      selectedTileColor: Colors.purple.shade100,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xFFeee6ff)
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFe6ccff),
      unselectedItemColor: Colors.purple.shade200,
      selectedItemColor: Colors.purple,

    ),

  );
  static ThemeData darkTheme=ThemeData.dark().copyWith(
    primaryColor: Colors.purple,

    appBarTheme: AppBarThemeData(
      // backgroundColor: Colors.purple.,
      iconTheme: IconThemeData(
        color: Colors.purple.shade200,
        size: 30,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.purple.shade200,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: 'Fira Sans',
      ),
      elevation: 5.0,
      shadowColor: Colors.purple.shade200,
      scrolledUnderElevation: 8.0,
    ),

    // scaffoldBackgroundColor: Color(0xFFeee6ff),

    textTheme: TextTheme(

      titleLarge: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 40,
      ),
      bodyMedium: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 30,
      ),
      bodySmall: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 20,
      ),

      labelLarge: TextStyle(
        color: Colors.purple.shade200,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      labelMedium: TextStyle(
        color: Colors.purple.shade200,
        fontSize: 15,
      ),
      labelSmall: TextStyle(
        color: Colors.red.shade400,
        fontSize: 15,
      ),
      displaySmall: TextStyle(
          color: Colors.red.shade400,
          fontSize: 20,
          fontWeight: FontWeight.w500
      ),
      displayMedium: TextStyle(
        color: Colors.purple.shade200,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      displayLarge: TextStyle(
        color: Colors.purple.shade200,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.purple.shade200,
        // backgroundColor: Colors.purple,
        side: BorderSide(
          color: Colors.purple.shade200,
        )
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.purple.shade200,
        // backgroundColor: Color(0xfff7f2ff),
        side: BorderSide(
          color: Colors.purple.shade200,
          width: 0.1,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.purple,
          // alignment: Alignment.centerRight,
        )
    ),

    primaryIconTheme: IconThemeData(
        color: Colors.purple,
        size: 40
    ),

    iconTheme: IconThemeData(
      color: Colors.purple,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      prefixIconColor: Colors.purple.shade200,
      suffixIconColor: Colors.purple.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(width: 1,color: Colors.purple.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(width: 1,color: Colors.purple.shade200),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.purple.shade200)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.red.shade400)
      ),
      focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Colors.red.shade400)
      ),
    ),

    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return Colors.purple.shade200;
        }
        return Colors.purple.shade200;
      }),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.purple.shade200,
          width: 1,
        )
      ),
      // tileColor: Color(0xFFeee6ff),
      selectedColor: Colors.purple,
      textColor: Colors.purple.shade200,
      iconColor: Colors.purple.shade200,
      selectedTileColor: Colors.purple.shade100,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
    ),
    //
    // drawerTheme: DrawerThemeData(
    //     // backgroundColor: Color(0xFFeee6ff)
    // ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF262A2B),
      unselectedItemColor: Colors.purple.shade400,
      selectedItemColor: Colors.purple.shade200,
    ),

  );
}