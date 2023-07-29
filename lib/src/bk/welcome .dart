import 'package:flutter/material.dart';
import 'package:my_app/src/bk/login_screen.dart';
import 'package:my_app/src/constants/image_strings.dart';
import 'package:my_app/src/constants/sizes.dart';
import 'package:my_app/src/constants/text_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';
import 'login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE1EAFF),
              Colors.white,
            ],
          ),
        ),
        padding: EdgeInsets.all(tSplashContainerSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Transform.scale(
                  scale: 1.9, // faktor skala yang diinginkan
                  child: Image(
                    image: AssetImage(tVektor),
                    fit: BoxFit
                        .contain, // Mengatur gambar agar tetap proporsional dan tidak terputus saat diubah ukurannya
                  ),
                ),
                Transform.scale(
                  scale: 1.2, // faktor skala yang diinginkan
                  child: Image(
                    image: AssetImage(tSplashImage),
                    height: height * 0.6,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    tWelcomeTitle,
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF000000),
                    ),
                  ),
                ),
                Text(
                  tWelcomeSubTitle,
                  textAlign: TextAlign.center,
                   style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(150, 48),
                  ),
                  child: Text(
                    tLogin,
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600), // Ukuran teks tombol
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
