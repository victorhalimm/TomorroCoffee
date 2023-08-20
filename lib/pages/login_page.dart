import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/pages/main_page.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? usernameError;
  String? passwordError;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void resetError() {
    setState(() {
      usernameError = passwordError = null;
    });
  }

  void handleLogin() {
    resetError();
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      setState(() {
        usernameError = "Username can't be empty";
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Password can't be empty";
      });
      return;
    }

    if (username.length < 8) {
      setState(() {
        usernameError = "Username must have at least 8 letters";
      });
      return;
    }

    if (password.contains(' ')) {
      setState(() {
        passwordError = "Password must not have spaces";
      });
      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return MainPage(username: username);
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: -200,
                right: -200,
                child: Container(
                  child: Blob.animatedFromID(
                    id: const [
                      '7-5-86532',
                      '7-5-6',
                      '7-5-783',
                      '7-5-46',
                      '7-5-517089'
                    ],
                    size: 500,
                    loop: true,
                    duration: const Duration(seconds: 2),
                    styles: BlobStyles(
                      gradient: const LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.amber,
                      ]).createShader(const Rect.fromLTRB(0, 0, 300, 300)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/tomorro_logo.png"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 24),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: screenWidth * 0.8,
                        child: const Text(
                          "Please sign in to get full benefits",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: screenWidth * 0.8,
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                            errorText: usernameError,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),                                  
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.deepOrange)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: screenWidth * 0.8,
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorText: passwordError,
                            labelText: "Password",
                            labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),                                  
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.deepOrange)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.deepOrange, Colors.amber]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ElevatedButton(
                            onPressed: handleLogin,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.8, 50),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      "Don't have an account yet? Register Now",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
