import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/src/bk/login_screen.dart';
import 'package:my_app/src/constants/image_strings.dart';
import 'package:my_app/src/constants/text_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'visi_misi.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Tableee extends StatefulWidget {
  @override
  State<Tableee> createState() => _TableeeState();
}

class _TableeeState extends State<Tableee> {
  final List<String> imgList = [
    tCoursel,
    'assets/coursel2.png',
    'assets/coursel1.png',
    'assets/coursel2.png',
  ];

  // List<Map<String, String>> classList = [
  //   {
  //     'Name': 'Math',
  //     'kelas': 'XI Pplg1',
  //     'status': 'Active',
  //   },
  // {
  //   'className': 'Science',
  //   'status': 'Inactive',
  // },
  // {
  //   'className': 'English',
  //   'status': 'Active',
  // },
  // ];

  int _pilihanbottom = 0;

 



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

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFE1EAFF),
          title: Row(
            children: [
              CircleAvatar(
                radius: 15, // Ukuran radius CircleAvatar
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.grey[600],
                  size: 17, // Ukuran ikon
                ),
              ),
              SizedBox(width: 7), // Memberikan jarak antara judul dan ikon
              Text(
                (preferences.getString('name').toString()),
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // END APP BAR

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Menambahkan crossAxisAlignment
              children: [
                const SizedBox(
                  height: 15,
                ),
                // IMAGE SLIDER
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    onPageChanged: (index, carouselReason) {
                      print(index);
                    },
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset(
                                      item,
                                      fit: BoxFit.cover,
                                      width: 1090.0,
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 30.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                // END COURSEL IMAGE

                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        tTableee,
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFF000000),
                        ),
                      ),

                      Icon(
                        Icons
                            .table_chart, // Ikon yang digunakan, bisa diganti dengan ikon yang diinginkan
                        size: 18, // Ukuran ikon
                        color: const Color.fromARGB(193, 0, 0, 0), // Warna ikon
                      ),
                      SizedBox(
                          width: 8), // Memberikan jarak antara ikon dan teks
                    ],
                  ),
                ),
                // end

                // LIST VIEW
                const SizedBox(
                  height: 10,
                ),
                // card

                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: FutureBuilder(
                      future: getBuku(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Color.fromARGB(152, 0, 109, 233),
                                    width: 1,
                                  ),
                                ),
                                // color: Colors.transparent,
                                color: Color.fromARGB(250, 242, 245, 252),
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data['data'][index]
                                            ['kategori'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text('Tempat : '),
                                          Text(
                                            snapshot.data['data'][index]
                                                ['tempat'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text('Jam : '),
                                          Text(
                                            snapshot.data['data'][index]['jam'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text('Tanggal : '),
                                          Text(
                                            snapshot.data['data'][index]
                                                ['tanggal'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 16),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Aksi saat tombol ditekan
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                152, 0, 109, 233),
                                          ),
                                          child: Text( snapshot.data['data'][index]
                                                ['status'],),
                                        ),
                                      ),
                                   
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),

                // end card
              ],
            ),
          ),
        ),
      
        ),
      
    );
  }
}
