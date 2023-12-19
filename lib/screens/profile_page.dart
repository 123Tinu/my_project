import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final loginKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var mobile = TextEditingController();
  var emailController = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 214, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 214, 247),
        title: const Text("Edit Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
      ),
      body: Form(
          key: loginKey,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Stack(children: [
                      const CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(
                            'assets/images1/propic2.jpg',
                          ),
                        ),
                      ),
                      Positioned(
                          left: 110,
                          top: 115,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_box,
                                size: 40,
                              )))
                    ]),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide()),
                          hintText: "Name",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.person)),
                      controller: mobile,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide()),
                          hintText: "Mobile no",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.phone)),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mobile no can't be empty";
                        }
                        if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
                            .hasMatch(value)) {
                          return "Enter a valid mobile number";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
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
                          return " Your password must be at 8 to 12 least characters long,\n include a number, an uppercase letter and a lowercase letter";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      width: 240,
                      height: 55,
                      child: TextButton(
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Saved")),
                              );
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 23),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
