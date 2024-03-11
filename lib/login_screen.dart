import 'package:example_login/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;

  // void signIn(BuildContext context) async {
  //   try {
  //     UserCredential authUser = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password);

  //     if (authUser.user != null) {
  //       // ignore: use_build_context_synchronously
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const HomeScreen(),
  //         ),
  //       );
  //     }
  //   } catch (error) {
  //     print("Error signing in: $error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      bgImage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.41,
                      width: width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.8],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                              ])),
                    ),
                    const Positioned(
                      bottom: 2,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              appName,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              slogan,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        primaryColor.withOpacity(0.2),
                        primaryColor.withOpacity(0.4)
                      ]),
                      border: const Border(
                        left: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                    child: const Text(
                      " $loginText ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please Enter the Email";
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(email)) {
                        return "It is not valid email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        prefixIcon: Icon(Icons.email, color: primaryColor),
                        labelText: "Email Address",
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Please Enter the Password";
                      } else if (password.length < 8 || password.length > 15) {
                        return "Password has more than  9 characters and less than 15 characters";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 16)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(forgetpassword),
                  ),
                ),
                Center(
                    child: SizedBox(
                  width: width - 30,
                  height: height * 0.08,
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        // signIn(context);
                        if (_email == "test@gmail.com" &&
                            _password == "root1234") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          print("Invalid Login");
                        }
                      }
                      FocusScope.of(context).unfocus();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // padding: EdgeInsets.all(15.0),
                    ),
                    child: const Text(
                      "Login to account",
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
