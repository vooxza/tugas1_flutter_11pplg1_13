import 'package:flutter/material.dart';
import 'package:flutter_testing_1/home.dart';
import 'package:flutter_testing_1/kalkulator.dart';
import 'package:flutter_testing_1/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login page"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to our first app", style: TextStyle(fontSize: 15, color: Colors.blueGrey,fontWeight: FontWeight.bold),),
            Center(
              child: Image.asset('assets/logo_flutter.png',width: 100,height: 100,),),
            SizedBox(height: 10),
            Text("Please enter your username and password"),
            TextField(controller: _usernameController, decoration: InputDecoration(hintText: "Username", border: OutlineInputBorder(),prefixIcon: Icon(Icons.person),),),
            SizedBox(height: 10,),
            TextField(controller: _passwordController, obscureText:true, decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder(),prefixIcon: Icon(Icons.lock),),),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == "admin" && password == "admin123") {
                    setState(() {
                      _statusLogin = "sukses login";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KalkulatorPage()),
                      );
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login Berhasil\nUsername: $username"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                      setState(() {
                        _statusLogin = "gagal login";
                      });
                  }
                },
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 10,),
            Text(_statusLogin, style: TextStyle(fontSize: 15, color: Colors.blueGrey,fontWeight: FontWeight.bold),),
            Center(
              child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text("Belum punya akun? Register di sini"),
            ),
            )

          ],
        ),
      ),
    );
  }
}

