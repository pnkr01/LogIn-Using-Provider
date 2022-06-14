import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stl_provider/global.dart';
import 'package:stl_provider/provider/auth.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIn"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                    ),
                    onPressed: () {
                      if (validateForm()) {
                        authProvider.login(emailController.text.trim(),
                            passwordController.text.trim(), context);
                      } else {
                        showSnackBar(context, "Fill all");
                      }
                    },
                    child: Center(
                      child: authProvider.loading
                          ? const CircularProgressIndicator()
                          : const Text("Log In"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateForm() {
    if (emailController.text.isNotEmpty && passwordController.text.length > 5) {
      return true;
    } else {
      return false;
    }
  }
}
