import 'package:flutter/material.dart';
import 'package:news_api/Routs/route_names.dart';

class ScreenOnboard extends StatelessWidget {
  const ScreenOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "images/onboard.png",
              height: MediaQuery.sizeOf(context).height / 1.7,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Discover Breaking News",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 111, 168, 194)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Make it easy for users to access the latest and most recent news quickly and easily from a single platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.home);
                    },
                    icon: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                      size: 40,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
