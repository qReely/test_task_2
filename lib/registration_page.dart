import 'package:flutter/material.dart';
import 'package:test_task_2/button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
          automaticallyImplyLeading: true,
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Регистрация",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: loginController,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Логин",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Телефон",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Почта",
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
                    icon: _showPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                hintText: "Пароль",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Expanded(
              child: Container(
                alignment: FractionalOffset.bottomCenter,
                padding: const EdgeInsets.only(bottom: 30),
                child: button(
                  "Создать аккаунт",
                  context,
                      () async => {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Аккаунт создан'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              // SAVE CREATED USER
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
