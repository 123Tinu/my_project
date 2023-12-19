import 'package:flutter/material.dart';
import 'package:my_project/screens/signin_page.dart';
import 'package:my_project/screens/signup_page.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 214, 247),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "WELCOME",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 60),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Explore a wide range of stylish and high-quality men's footwear at Shoekeeper. Find the perfect pair for every occasion and step up your style game.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Image(
                  image: AssetImage("assets/images1/nikeshoelogo3.png")),
              const SizedBox(
                height: 70,
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
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Signin_Page();
                            },
                          ));
                        });
                        if (loginkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Success")),
                          );
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
              const Text(
                "Or",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  width: 150,
                  height: 55,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignupPage();
                            },
                          ));
                        });
                        if (loginkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Success")),
                          );
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 23),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
