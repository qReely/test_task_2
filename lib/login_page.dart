import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_task_2/registration_page.dart';
import 'package:test_task_2/universities_page.dart';
import 'button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Авторизация",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Логин или почта",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 16),
              obscureText: !_showPassword,
              obscuringCharacter: '●',
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: _showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
                hintText: "Пароль",
              ),
            ),
            const SizedBox(height: 40,),
            // CHECK LOGIN
            button("Войти", context, () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const UniversityPage()), (route) => false)),
            const SizedBox(height: 20,),
            button("Зарегистрироваться", context, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage())))
          ],
        ),
      ),
    );
  }
}
