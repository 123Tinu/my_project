import 'package:flutter/material.dart';
import 'package:my_project/screens/profile_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String title= "Settings";
  bool switch1 = false;
  bool switch2 = false;

  String dropDownButton1 = "English";
  var languages = ["English", "Malayalam", "Tamil", "hindi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ProfilePage();
                        },
                      ));
                    },
                    leading: const Icon(
                      Icons.account_circle,
                      size: 25,
                    ),
                    title: const Text("Account"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.privacy_tip,
                      size: 25,
                    ),
                    title: const Text("Privacy Policy"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        switch1 = !switch1;
                      });
                    },
                    leading: const Icon(
                      Icons.notifications,
                      size: 25,
                    ),
                    title: const Text("Notifications"),
                    trailing: Switch(
                      activeColor: Colors.black,
                      value: switch1,
                      onChanged: (value) {
                        setState(() {
                          switch1 = !switch1;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        switch2 = !switch2;
                      });
                    },
                    leading: const Icon(
                      Icons.light_mode_outlined,
                      size: 25,
                    ),
                    title: const Text("Dark/Light"),
                    trailing: Switch(
                      activeColor: Colors.black,
                      value: switch2,
                      onChanged: (value) {
                        setState(() {
                          switch2 = !switch2;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.language,
                        size: 25,
                      ),
                      title: const Text("Language"),
                      trailing: DropdownButton(
                        value: dropDownButton1,
                        items: languages.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownButton1 = newValue!;
                          });
                        },
                      )),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.password,
                      size: 25,
                    ),
                    title: const Text("Change Password"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    title: const Text("Delete Account"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.logout,
                      size: 25,
                    ),
                    title: const Text("Log Out"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
