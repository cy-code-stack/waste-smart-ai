import 'package:flutter/material.dart';
import 'package:wastesmart_final/pages/auth/signin.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/welcome_logo.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const Positioned(
              top: 20,
              right: -10,
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 100,
              ),
            ),
            const Positioned(
              top: 100,
              left: -25,
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 150,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xff377557),
                    const Color(0xff3E7A5D).withOpacity(0.9),
                    const Color(0xff3E7A5D).withOpacity(0.2),
                  ],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 250, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        height: 0.4,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'DNSC',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'WasteSmart',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        height: 0.4,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 70),
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 96, 175, 137),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
