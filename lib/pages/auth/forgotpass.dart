import 'package:flutter/material.dart';

import 'signin.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/blob-2.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: const Color(0xff4D8D6E).withOpacity(0.7),
                ),
                const Positioned(
                  top: 60,
                  right: 40,
                  child: Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: -10,
                  child: Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 120, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'WasteSmart',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Think for nature',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20, top: 5),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff292929),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(bottom: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter your E-mail',
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: const Color(0xff292929)
                                        .withOpacity(0.6),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ), // Add this line to create a border
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 96, 175, 137),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Reset your password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
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
        ),
      ),
    );
  }
}
