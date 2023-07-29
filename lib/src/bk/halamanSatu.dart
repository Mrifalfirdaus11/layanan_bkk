import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/src/bk/profile.dart';
import 'package:my_app/src/constants/image_strings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'chat.dart';
import 'login_screen.dart';
import 'dart:convert';
import 'seting.dart';

class HalamanSatu extends StatefulWidget {
  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  int currentTab = 0;
  final List<Widget> screens = [
    HalamanSatu(),
    Chat(),
    Profile(),
    Seting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HalamanSatu();

// FLUTTER GET DATA
  late SharedPreferences preferences;
  bool isLoading = false;
  void initState() {
    super.initState();
    getBuku();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  Future getBuku() async {
    preferences = await SharedPreferences.getInstance();
    int userId = preferences.getInt('user_id') ??
        0; // Default value jika 'user_id' tidak ditemukan
    String id = userId.toString();
    final String url = 'http://127.0.0.1:8000/api/jadwalkonseling?id=' + id;
    var respone = await http.get(Uri.parse(url));
    var jsonResponse = jsonDecode(respone.body);
    if (respone.statusCode == 200) {
      var jsonResponse = jsonDecode(respone.body);
      var dataList = jsonResponse['data'];
      return jsonResponse;
      // for (var data in dataList) {`
      //   var selectedField = data['siswa']['']; // Ganti 'field' dengan field yang diinginkan
      //   return print(selectedField);
      // }
    } else {
      print('Request failed with status: ${respone.statusCode}');
    }
  }
  // END

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFDDEFFF),
        body: Stack(
          children: [
            // TEXT HELLO
            Positioned(
              top: 39,
              left: 37,
              child: Text(
                'Hello',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
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
              top: 94,
              left: 37,
              child: Container(
                width: 307,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors
                      .white, // Mengganti warna latar belakang menjadi putih (Colors.white)
                  border: Border.all(
                    color: Color.fromARGB(212, 102, 113, 119), // Menambahkan border dengan warna 667177
                  ),
                ),
                child: Stack(
                  // Menambahkan Stack untuk menempatkan ikon dan search box di dalam kontainer
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
                      top: 3,
                      left: 37,
                      child: Container(
                        width: 230,
                        height: 21,
                        child: TextField(
                          // Fitur search box
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF667177),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF667177),
                          ),
                        ),
                      ),
                      // child: Text(
                      //   'Search',
                      //   style: GoogleFonts.montserrat(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w500,
                      //     color: const Color(0xFF667177),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

            // SEARCH END

            // ICON NOTIFICATION
            // Icon hitam
            Positioned(
              left: 307,
              top: 44,
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
            Stack(
              children: [
                Positioned(
                  top: 157,
                  left: 37,
                  child: Container(
                    width: 307,
                    height: 144,
                    decoration: BoxDecoration(
                      color: Color(0xFF178BCF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 25.0),
                              child: Text(
                                'Welcome to',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFF000000),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Starling',
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFF000000),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: 81,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xFF17C2EC),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "Read More",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ), // Jarak antara teks "Starling" dan gambar
                        Container(
                          height: 1000,
                          child: Image.asset('assets/cardIMG.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // END CARD

            // TEXT KATEGORI
            Positioned(
              top: 325,
              left: 37,
              child: Text(
                'Kategori',
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF000000),
                ),
              ),
            ),
            // END TEXT KATEGORI
            Positioned(
              top: 359,
              left: 37,
              child: Row(
                children: [
                  // First Card
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xFF17C2EC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/karier.png', // Ganti 'assets/karier.png' dengan path gambar Anda
                            width: 24, // Ganti ukuran gambar sesuai kebutuhan
                            height: 24, // Ganti ukuran gambar sesuai kebutuhan
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Karier',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 42), // Space between cards

                  // Second Card
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:
                             Color(0xFF17C2EC),// Ganti dengan warna yang diinginkan
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/pribadi.png', // Ganti 'assets/karier.png' dengan path gambar Anda
                            width: 24, // Ganti ukuran gambar sesuai kebutuhan
                            height: 24, // Ganti ukuran gambar sesuai kebutuhan
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 8), // Jarak antara card dan teks di bawahnya
                      Text(
                        'Pribadi',
                        style: GoogleFonts.montserrat(
                          fontSize:
                              10, // Ganti dengan ukuran font yang diinginkan
                          fontWeight: FontWeight
                              .w600, // Ganti dengan ketebalan font yang diinginkan
                          color: Colors
                              .black, // Ganti dengan warna teks yang diinginkan
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 42), // Space between cards

                  // Third Card
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:
                             Color(0xFF17C2EC), // Ganti dengan warna yang diinginkan
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Center(
                            child: Image.asset(
                              'assets/sosial.png', // Ganti 'assets/karier.png' dengan path gambar Anda
                              width: 24, // Ganti ukuran gambar sesuai kebutuhan
                              height:
                                  24, // Ganti ukuran gambar sesuai kebutuhan
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 8), // Jarak antara card dan teks di bawahnya
                      Text(
                        'Sosial',
                        style: GoogleFonts.montserrat(
                          fontSize:
                              10, // Ganti dengan ukuran font yang diinginkan
                          fontWeight: FontWeight
                              .w600, // Ganti dengan ketebalan font yang diinginkan
                          color: Colors
                              .black, // Ganti dengan warna teks yang diinginkan
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 42), // Space between cards

                  // Third Card
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color:
                             Color(0xFF17C2EC), // Ganti dengan warna yang diinginkan
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Center(
                            child: Image.asset(
                              'assets/belajar.png', // Ganti 'assets/karier.png' dengan path gambar Anda
                              width: 24, // Ganti ukuran gambar sesuai kebutuhan
                              height:
                                  24, // Ganti ukuran gambar sesuai kebutuhan
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 8), // Jarak antara card dan teks di bawahnya
                      Text(
                        'Belajar',
                        style: GoogleFonts.montserrat(
                          fontSize:
                              10, // Ganti dengan ukuran font yang diinginkan
                          fontWeight: FontWeight
                              .w600, // Ganti dengan ketebalan font yang diinginkan
                          color: Colors
                              .black, // Ganti dengan warna teks yang diinginkan
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // CARD KATEGORI

            // TEXT ALl
            Positioned(
              top: 445,
              left: 37,
              child: Text(
                'All',
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF000000),
                ),
              ),
            ),
            // END TEXT All

            // CARD ALL

            Container(
              margin: EdgeInsets.only(top: 488),
              child: FutureBuilder(
                future: getBuku(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 16.5, 17, 20),
                              width: 310,
                              height: 175,
                              decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // group148MCH (3:36)
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // fauzankirana6Qm (3:37)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 2.5),
                                          child: Text(
                                            'Fauzan Kirana',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2175,
                                              color: Color(0xff17c2ec),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // bimbinganbelajarZZF (3:38)
                                          snapshot.data['data'][index]
                                              ['kategori'],
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2175,
                                            color: Color(0xffc4c4c4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // autogroupayroWDb (CX5pdRGCmhWDeEXbQXAyRo)
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          // autogroupstof1RF (CX5pkv3iJzsf3PbxVVStof)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 27, 32),
                                          width: 143,
                                          height: 61,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // group148sCZ (3:39)
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 143,
                                                  height: 56,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        // autogrouplsz7Ckd (CX5qSZaKPRibTuZFvVLsZ7)
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 11, 15),
                                                        width: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              // group133wy7 (3:42)
                                                              margin: EdgeInsets
                                                                  .fromLTRB(0,
                                                                      0, 20, 0),
                                                              width: 25,
                                                              height: 25,
                                                              child:
                                                                  Image.asset(
                                                                'assets/kategori.png', // Ganti dengan URL gambar yang sesuai
                                                                width: 25,
                                                                height: 25,
                                                              ),
                                                            ),
                                                            Container(
                                                              // march202209001100amUTF (3:41)
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxWidth:
                                                                          87),
                                                              child: Text(
                                                                snapshot.data[
                                                                        'data'][
                                                                    index]['jam'],
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height:
                                                                      1.2175,
                                                                  color: Color(
                                                                      0xff000000),
                                                                ),
                                                              ),
                                                            ),
                                                            // Text(
                                                            //   snapshot.data['data'][index]
                                                            //       ['tanggal'],
                                                            //   style: TextStyle(
                                                            //     fontFamily: 'Montserrat',
                                                            //     fontSize: 11,
                                                            //     fontWeight: FontWeight.w600,
                                                            //     height: 1.2175,
                                                            //     color: Color(0xff000000),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        // tempatpendopoxdK (3:40)
                                                        snapshot.data['data']
                                                            [index]['tempat'],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.2175,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // group1667WD (3:47)
                                                left: 0,
                                                top: 36,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 25,
                                                    height: 25,
                                                    child: Image.asset(
                                                      'assets/tempat.png', // Ganti dengan URL gambar yang sesuai
                                                      width: 25,
                                                      height: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // group148Eqj (3:53)
                                          width: 108,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            // color: Color(0xff17c2ec),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Aksi saat tombol ditekan
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF17C2EC), // Ubah warna tombol menjadi merah
                                                ),
                                                child: Text(
                                                  snapshot.data['data'][index]
                                                      ['status'],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10), // Jarak antara setiap card
                          ],
                        );
                      },
                    );
                  } else {
                    // Tampilkan widget sementara saat data masih dimuat
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),

            // END CARD ALL
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF17C2EC),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HalamanSatu();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: currentTab == 0 ? Color(0xFF17C2EC) : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Color(0xFF17C2EC)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Chat();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: currentTab == 1 ? Color(0xFF17C2EC) : Colors.grey,
                          ),
                          Text(
                            'Visi',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Color(0xFF17C2EC)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Tab Kanan Icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Profile();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 2 ? Color(0xFF17C2EC) : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Color(0xFF17C2EC)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Seting();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: currentTab == 3 ? Color(0xFF17C2EC) : Colors.grey,
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Color(0xFF17C2EC)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
