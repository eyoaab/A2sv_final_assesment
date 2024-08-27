import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => HomePage())
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
       
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Welcome to',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            
            
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'SPEEDY CHOW',
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}