import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task_2/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Профиль",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image(
                image: Image.asset("assets/user.png").image,
                height: 96,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Name Surname",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "email@gmail.com",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(146, 146, 146, 1)),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Выйти",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  onPressed: () {
                    // IMPLEMENT EXIT FROM ACCOUNT
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
