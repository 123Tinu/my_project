import 'package:flutter/material.dart';
import 'package:my_project/screens/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<SignupPage> {
  final loginkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var emailController = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  bool passwordVisible = false;
  bool passVisible = false;

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
                      "Register Here",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                const Text(
                  "Create Your Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide()),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.person)),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      if (!RegExp(r'^[A-Za-z]+([\ A-Za-z]+)$')
                          .hasMatch(value)) {
                        return "Enter a valid Name";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        filled: true,
                        fillColor: Colors.white70,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(
                          Icons.lock,
                        )),
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,12}$')
                          .hasMatch(value)) {
                        return " Your password must be 8 to 12 characters long,\n include a number, an uppercase letter and a lowercase letter.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVisible = !passVisible;
                              });
                            },
                            icon: Icon(passVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    controller: confirm_password,
                    obscureText: !passVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Re-enter your password";
                      } else if (value != password.text) {
                        return "Password Must Be Same";
                      }
                      return null;
                    },
                  ),
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
                    width: 200,
                    height: 55,
                    child: TextButton(
                        onPressed: () {
                          if (loginkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Saving Data")),
                            );
                          }
                        },
                        child: const Text(
                          "Sign Up",
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
                              return const Signin_Page();
                            },
                          ));
                        });
                      },
                      child: const Text(
                        "Already Have An Account? Sign In",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 60,
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
                      width: 60,
                      height: 60,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              image: AssetImage('assets/images1/google.png'))),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
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
