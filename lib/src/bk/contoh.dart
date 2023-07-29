import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/src/constants/image_strings.dart';

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key}) : super(key: key);

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // ... Other Positioned widgets as before ...
               // TEXT HELLO
          Positioned(
            top: 39,
            left: 37,
            child: Text(
              'Hello',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF000000),
              ),
            ),
          ),
          // END TEXT HELLO

          // TEXT SELAMAT DATANG DI STARLING
          Positioned(
            top: 58,
            left: 37,
            child: Text(
              'Selamat datang di Starling',
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF000000),
              ),
            ),
          ),
          // END TEXT
              // SEARCH
              Positioned(
                top: screenHeight * 0.25,
                left: screenWidth * 0.1,
                child: Container(
                  width: screenWidth * 0.8,
                  height: 31,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors
                    .white, // Mengganti warna latar belakang menjadi putih (Colors.white)
                border: Border.all(
                  color: Color(
                      0xFF667177), // Menambahkan border dengan warna 667177
                ),
              ),
              child: Stack(
                // Menambahkan Stack untuk menempatkan ikon di dalam kontainer
                children: [
                  Positioned(
                    // Menambahkan ikon search
                    top: 6, // Posisi Y ikon
                    left: 13, // Posisi X ikon
                    child: Icon(
                      // Membuat ikon
                      Icons.search,
                      color: Color(0xFF667177), // Warna ikon
                      size: 21,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 37,
                    child: Text(
                      'Search',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF667177),
                      ),
                    ),
                  ),
                ],
              ),
                ),
              ),
              // SEARCH END

              // ICON NOTIFICATION
              Positioned(
                left: screenWidth * 0.85,
                top: screenHeight * 0.08,
                     child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Icon(
                Icons.notifications,
                size: 19,
                color: Colors.black,
              ),
            ),
              ),
              // END NOTIFICATION

              // CARD
              Positioned(
                top: screenHeight * 0.45,
                left: screenWidth * 0.1,
                  child: Container(
              width: 307,
              height: 144,
              decoration: BoxDecoration(
                color: Color(0xFF007EC8), // Warna latar belakang card utama
                borderRadius: BorderRadius.circular(
                    8), // Mengatur border radius card utama
              ),
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(26, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ), // Jarak antara "Welcome to" dan "Starling"
                        Text(
                          'Starling',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500, // Font medium
                            color: Colors.white, // Warna teks
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ), // Jarak antara "Starling" dan card di dalamnya
                        Container(
                          width: 81,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Color(
                                0xFF17C2EC), // Warna latar belakang card di dalam
                            borderRadius: BorderRadius.circular(
                                8), // Mengatur border radius card di dalam
                          ),
                          child: Center(
                            child: Text(
                              "Read More",
                              style: TextStyle(
                                color: Colors.white, // Warna teks putih
                                fontSize: 11, // Ukuran font 11
                                fontWeight: FontWeight.w600, // Style semibold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 217, // Posisi Y gambar
                    left: 153, // Posisi X gambar
                    child: Container(
                      width: 152, // Lebar gambar
                      height: 152, // Tinggi gambar
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              tHero), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Mengatur border radius gambar
                      ),
                    ),
                  ),
                ],
              ),
            ),
              ),
              // END CARD
            ],
          );
        },
      ),
    );
  }
}
