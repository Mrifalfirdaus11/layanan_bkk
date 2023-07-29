import 'package:flutter/material.dart';

import 'package:my_app/src/bk/table.dart';
import '../constants/image_strings.dart';

class VisiMisi extends StatefulWidget {
  const VisiMisi({Key? key}) : super(key: key);

  @override
  _VisiMisiState createState() => _VisiMisiState();
}

class _VisiMisiState extends State<VisiMisi> {
  void _goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF2F5FC),
      appBar: AppBar(
         elevation: 0,
       backgroundColor: Color(0xFFE1EAFF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: _goBack,
        ),
      ),
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
        child: Center(
          child: Container(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Transform.scale(
                  scale: 0.7,
                  child: Image(
                    image: AssetImage(tTebee),
                    height: size.height * 0.3,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Visi Misi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: size.width * 0.9,
                  child: Text(
                    'Menghasilkan lulusan yang kompeten dalam IPTEK DAN  IMTAQ, serta mampu bersaing pada tingkat nasional dan global\\n'
                    'Menumbuhkan semangat kreatifitas, bersinergi dan kompetitif kepada seluruh warga sekolah\\n'
                    'Melaksanakan kurikulum melalui pembelajaran dan penilaian berbasis kompetensi, berbasis wirausaha, berwawasan lingkungan, dan berlandaskan kejujuran\\n'
                    'Meningkatkan kualitas sumber daya manusia melalui sertifikasi Kompetensi Tingkat Nasional dan Internasional\\n'
                    'Mengembangkan potensi peserta didik melalui kegiatan Minat dan Bakat dan pembinaan kedisiplinan\\n'
                    'Menerapkan layanan prima dalam pengelolaan sekolah melalui Sistem Manajeman Mutu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
