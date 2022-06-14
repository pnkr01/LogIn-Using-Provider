import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stl_provider/provider/auth.dart';
import 'package:stl_provider/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AuthProvider()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LogInScreen(),
      ),
    );
  }
}
