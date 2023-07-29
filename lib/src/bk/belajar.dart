import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Belajar extends StatefulWidget {
  const Belajar({super.key});

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
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
    return Scaffold(
      body: Container(
        width:  double.infinity,
  height:  800,
  decoration:  BoxDecoration (
    color:  Color(0xfff2f5fc),
  ),
  child:  
Stack(
  children:  [
Positioned(
  // Gub (6:3)
  left:  0,
  top:  0,
  child:  
Align(
  child:  
SizedBox(
  width:  375,
  height:  321,
  child:  
Image.asset('assets/blue.png',
fit: BoxFit.cover,
),
),
),
),
Positioned(
  // rectangle42nN9 (6:4)
  left: 0,
  top: 293,
  child: Align(
    child: SizedBox(
      width: 375,
      height: 507,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff0079c1)),
          color: Color(0xffddefff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                                                  primary: Colors
                                                      .red, // Ubah warna tombol menjadi merah
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
            ],
          ),
        ),
      ),
    ),
  ),
),

Positioned(
  // group37s8h (6:45)
  left:  20,
  top:  20,
  child:  
Align(
  child:  
SizedBox(
  width:  27,
  height:  27,
//  child: Image.asset('assets/blue.png',
//   width: 27,
//   height: 27,
//  ),
),
),
),
Positioned(
  // bimbinganbelajarB9P (6:49)
  left:  106,
  top:  24,
  child:  
Align(
  child:  
SizedBox(
  width:  157,
  height:  20,
  child:  
Text(
  'Bimbingan Belajar',
  style: GoogleFonts.montserrat(
    fontSize:  16,
    fontWeight:  FontWeight.w700,
    height:  1.2175,
    color:  Color(0xff1e1e1e),
  ),
),
),
),
),
  ],
),
      ),
    );
    
  }
}