import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final loginkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 214, 247),
      body: Form(
        key: loginkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 225,
                ),
                const Center(
                    child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                )),
                Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      "please enter your email address.you will receive a link to create a new password via email",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
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
                              const SnackBar(content: Text("Check Your Mail")),
                            );
                          }
                        },
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        )),
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
