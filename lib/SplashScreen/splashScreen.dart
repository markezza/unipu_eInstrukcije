import 'package:flutter/material.dart';
import 'dart:async';
import'package:olx_app/welcome/welcome_screen.dart';
import 'package:olx_app/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  startTimer(){
    Timer(Duration(seconds: 5), () async{
      if(FirebaseAuth.instance.currentUser != null){
        Route newRoute = MaterialPageRoute(builder: (context) => HomeScreen() );
        Navigator.pushReplacement(context, newRoute);
      }
      else {
        Route newRoute = MaterialPageRoute(
            builder: (context) => WelcomeScreen());
        Navigator.pushReplacement(context, newRoute);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors:[
              Colors.purple,
              Colors.deepPurple,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.9, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp

          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/logo.png", width: 300.0,),
              ),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  "Ponudite, pronađite, naučite, položite kolegij!",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontFamily: "Lobster"
                  ),
                ),
              ),
            ],
          )
        ),
      ),

    );
  }
}
