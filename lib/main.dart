import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'NoteList/note_List.dart';
import 'Services/notes_services.dart';


void serviceLocator(){

  GetIt.instance.registerLazySingleton(() => NoteService());

}

void main() async{
  serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));

  return SplashScreen(
    seconds: 3,
    navigateAfterSeconds: NoteList(),
    routeName: "/",
    loadingText: Text(
        "Welcome to API Crud App",
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black
            )
        )
    ),

  styleTextUnderTheLoader: TextStyle(),
  );
  }

}