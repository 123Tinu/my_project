import 'package:flutter/material.dart';
import 'package:my_project/screens/forgot_password_page.dart';
import 'package:my_project/screens/home_page.dart';
import 'package:my_project/screens/main_page.dart';
import 'package:my_project/screens/signup_page.dart';

class Signin_Page extends StatefulWidget {
  const Signin_Page({super.key});

  @override
  State<Signin_Page> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<Signin_Page> {
  final loginkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool passwordVisible = false;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 214, 247),
        body: SingleChildScrollView(
          child: Form(
            key: loginkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                const Text(
                  "Welcome back! You've Been Missed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide()),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.mail)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(
                          Icons.lock,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,12}$')
                          .hasMatch(value)) {
                        return "Enter a valid password";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPassword();
                                },
                              ));
                            });
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    width: 150,
                    height: 55,
                    child: TextButton(
                        onPressed: () {
                          if (loginkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Success")),
                            );

                            setState(() {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                return MainPage();
                              },), (route) => false);
                            });
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 23),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignupPage();
                            },
                          ));
                        });
                      },
                      child: const Text(
                        "New user? Create new account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 130,
                ),
                const Text(
                  "Or continue with",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/google.png'))),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/phone.png'))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
