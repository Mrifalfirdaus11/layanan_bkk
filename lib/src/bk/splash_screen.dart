import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/main.dart';
import 'package:my_app/src/constants/image_strings.dart';
import 'package:my_app/src/constants/sizes.dart';
import 'package:my_app/src/constants/text_strings.dart';

import 'welcome .dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FC),
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
        child: Stack(
          children: [
            // Gambar
            AnimatedPositioned(
              left: 70,
              bottom: animate ? 0 : -30,
              duration: const Duration(milliseconds: 1600),
              child: Transform.scale(
                scale: 1.4, // faktor skala yang diinginkan
                child: Image(image: AssetImage(tSplashTopIcon)),
              ),
            ),
            // Gambar END

            // Text
            AnimatedPositioned(
              top: 90,
              left: animate ? tdefaultSize : -80,
              duration: const Duration(milliseconds: 1600),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        tAppTagLine,
                        style: GoogleFonts.nunito(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFFF000000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2), // Spasi antar elemen
                    Container(
                      child: Text(
                        tAppTagLinee,
                        style: GoogleFonts.nunito(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFFF000000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11), // Spasi antar elemen
                    Container(
                      child: Text(
                        tAppName,
                        style: GoogleFonts.nunito(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF1D88D8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // END Text

            // Gambar
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 95 : 0,
              left: 50,
              // left: MediaQuery.of(context).size.width *
              //     0., // Menggunakan MediaQuery untuk responsif
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: Transform.scale(
                  scale: 1, // faktor skala yang diinginkan
                  child: Image(image: AssetImage(tSplashImage)),
                ),
              ),
            ),

            // END GAMBAR
          ],
        ),
      ),
    );
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }
}
