// ignore_for_file: avoid_print, duplicate_ignore
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wastesmart_final/pages/auth/firebase_auth_implementation/firebase_auth-service.dart';
import 'package:wastesmart_final/pages/auth/signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService auth = FirebaseAuthService();

  String? _emailError;
  String? _nameError;
  String? _passwordError;
  String? _repeatPasswordError;
  bool _obscureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _validateForm() {
    bool isValid = true;

    if (_nameController.text.isEmpty) {
      setState(() {
        _nameError = 'This field is required';
      });
      isValid = false;
    } else {
      setState(() {
        _nameError = null;
      });
    }

    if (_emailController.text.isEmpty ||
        !_emailController.text.contains('@gmail.com')) {
      setState(() {
        _emailError = 'Please enter a valid email';
      });
      isValid = false;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    if (_passwordController.text.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters';
      });
      isValid = false;
    } else {
      setState(() {
        _passwordError = null;
      });
    }

    if (_repeatPasswordController.text != _passwordController.text) {
      setState(() {
        _repeatPasswordError = 'Passwords do not match';
      });
      isValid = false;
    } else {
      setState(() {
        _repeatPasswordError = null;
      });
    }

    return isValid;
  }

  void signUp() async {
    if (!_validateForm()) return;

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      showSuccessDialog();
      print('success');
    } else {
      print('error');
    }
  }

  void showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Success',
      desc: 'Signed up successfully!',
      btnOkOnPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      },
      btnOkIcon: Icons.check,
      btnOkColor: const Color(0xff4D8D6E),
    ).show();
  }

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
                        margin: const EdgeInsets.only(
                          top: 90,
                          bottom: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInPage(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_validateForm()) {
                                    signUp();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 96, 175, 137),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: const Text(
                                  'Sign Up',
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
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20, top: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Become part of the nature',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff292929),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter your name',
                                errorText: _nameError,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color:
                                      const Color(0xff292929).withOpacity(0.6),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                errorText: _emailError,
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color:
                                      const Color(0xff292929).withOpacity(0.6),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              obscureText: _obscureText,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                errorText: _passwordError,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 25,
                                  color:
                                      const Color(0xff292929).withOpacity(0.6),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xff292929)
                                        .withOpacity(0.6),
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: _repeatPasswordController,
                              decoration: InputDecoration(
                                labelText: 'Repeat Password',
                                errorText: _repeatPasswordError,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 25,
                                  color:
                                      const Color(0xff292929).withOpacity(0.6),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_validateForm()) {
                              signUp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 96, 175, 137),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Join our community',
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
