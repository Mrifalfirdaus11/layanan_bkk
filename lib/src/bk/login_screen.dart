import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/methods/api.dart';
import 'package:my_app/src/bk/halamanSatu.dart';
import 'package:my_app/src/bk/home.dart';
import 'package:my_app/src/bk/table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/src/constants/image_strings.dart';
import 'package:my_app/src/constants/sizes.dart';
import 'package:my_app/src/constants/text_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordd = true;

  late String message = '';

  void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString()
    };

    final result = await Api().postRequest(route: '/loginapi', data: data);
    final response = jsonDecode(result.body);

    if (response != null &&
        response.containsKey('user') &&
        response['user'] != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var user = response['user'];
      if (user.containsKey('id')) {
        await preferences.setInt('id', user['id']);
      }
      if (user.containsKey('siswa')) {
        await preferences.setString('name', user['siswa']['nama']);
      }
      if (user.containsKey('email')) {
        await preferences.setString('email', user['email']);
      }
      await preferences.setInt('user_id', user['siswa']['id']);
    
      await preferences.setString('token', response['token']);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response['message'])));

      if (response['status'] == 200) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HalamanSatu(),
        ));
      }
    } else {
      // Handle error case when the response or user data is missing
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            child: Container(
              padding: EdgeInsets.all(tSplashContainerSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section 1
                  Transform.scale(
                    scale: 1.2, // faktor skala yang diinginkan
                    child: Image(
                      image: AssetImage(tSplashImage),
                      height: size.height * 0.2,
                    ),
                  ),

                  // image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: tLoginTitle,
                            style: GoogleFonts.nunito(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF000000),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        tLoginSubTitle,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // text

                      // Section 2
                      Form(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: tFormHeight - 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_outlined),
                                  labelText: tEmail,
                                  hintText: tEmail,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                controller: password,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint),
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),

                              // end

                              const SizedBox(height: tFormHeight - 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(tForgetPassword),
                                ),
                              ),
                              const SizedBox(height: 15),
                              InkWell(
                                onTap: loginUser,
                                child: Container(
                                  width: double
                                      .infinity, // Lebar container yang diatur ke seluruh lebar
                                  height:
                                      40, // Tinggi container yang diatur sesuai kebutuhan Anda
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          10), // Margin vertikal yang diatur sesuai kebutuhan Anda
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(
                                          5), // Padding tombol yang diatur sesuai kebutuhan Anda
                                      minimumSize: Size(double.infinity,
                                          30), // Ukuran minimum tombol yang diatur sesuai kebutuhan Anda
                                      textStyle: TextStyle(
                                          fontSize:
                                              16), // Ukuran teks tombol yang diatur sesuai kebutuhan Anda
                                    ),
                                    onPressed: loginUser,
                                    child: Text('LOGIN'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
