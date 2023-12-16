import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/Login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  bool _isValidEmail(String email) => email.isNotEmpty;
  bool _isValidPassword(String password) => password.isNotEmpty;
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    var isValid = CombineLatestStream.combine2(
        _emailController.stream,
        _passwordController.stream,
        (email, password) =>
            _isValidEmail(email) && _isValidPassword(password));

    return TweenAnimationBuilder<double>(
        duration: const Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (_, opacity, child) => Opacity(
              opacity: opacity,
              child: child,
            ),
        child: Scaffold(
          appBar: AppBar(title: const Text('Reative Login')),
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StreamBuilder<String>(
                      stream: _emailController.stream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: const TextStyle(color: Colors.black),
                          onChanged: _emailController.add,
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<String>(
                      stream: _passwordController.stream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          style: const TextStyle(color: Colors.black),
                          onChanged: _passwordController.add,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<bool>(
                      initialData: false,
                      stream: isValid,
                      builder: (context, snapshot) {
                        bool validStatus = snapshot.data ?? false;
                        return AnimatedContainer(
                          color: validStatus ? Colors.green : Colors.red,
                          duration: const Duration(milliseconds: 800),
                          height: 50,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
setState(() {
  _isLoading=true;
 
});

 Future.delayed(const Duration(seconds: 1)).then((value) {
  setState(() {
    _isLoading=false;
  });
 });
                            },
                            child: _isLoading? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ): AnimatedSwitcher(
                                duration: const Duration(milliseconds: 800),
                                child: validStatus
                                    ? Text(key: UniqueKey(), 'Login')
                                    : Text(key: UniqueKey(), 'Cannot Login')),
                          ),
                        );
                      })
                ],
              )),
        ));
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    super.dispose();
  }
}
