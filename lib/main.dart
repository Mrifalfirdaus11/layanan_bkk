import 'package:flutter/material.dart';
import 'package:my_app/src/bk/belajar.dart';
import 'src/bk/splash_screen.dart';
import 'src/bk/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/bk/halamanSatu.dart';
import 'src/bk/crud.dart';
import 'src/bk/belajar.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   
   home: Crud(),
      // home: FutureBuilder(
      //     future: SharedPreferences.getInstance(), //memanggil fungsi nya
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(), //tampilan saat masih proses
      //         ); 
      //       } else if (snapshot.hasError) { 
      //         return Text('Some error has Occurred'); //tampilan saat terjadi error
      //       } else if (snapshot.hasData) {
      //         final token = snapshot.data!.getString('token');
      //         if (token != null) {
      //           return HalamanSatu(); //jika ada token ke home
      //           // return Cobaaa();
      //         } else {
      //           return LoginScreen(); //jika tidak akan ke login
      //         }
      //       } else {
      //         return LoginScreen();
      //       }
      //     }),
    );
  }
}