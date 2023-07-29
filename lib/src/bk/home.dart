import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

late SharedPreferences preferences;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState((){
      isLoading = true;
    });
   preferences =await SharedPreferences.getInstance();
    setState((){
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading? Center(child: CircularProgressIndicator(),):Column(
                  children: [
                    Text('Welcome'),
                    Text(preferences.getString ('email').toString()),
                  ],
                ),
      ),
    );
  }
}