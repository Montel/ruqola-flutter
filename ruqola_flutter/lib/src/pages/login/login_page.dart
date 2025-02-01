/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/main_window_page.dart';

class LoginPage extends StatefulWidget {
  final Rocketchataccount account;
  const LoginPage(this.account, {super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _email = '';
  String _serverUrl = '';
  String _password = '';
  bool passToggle = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successfully')),
      );
      widget.account.settings.setUserName = _email;
      widget.account.settings.setServerUrl = _serverUrl;
      widget.account.settings.setPassword = _password;
      widget.account.connect();
      // FIXME Don't full screen !!!
      // TODO verify if connection is ok !
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainWindow(widget.account)),
      );
    }
  }

  String? validatePassword(String? password) {
    // TODO add i18n here
    if (password!.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"), // I18n ?
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 120.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 5.0, left: 30.0, right: 30.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username or Email', // TODO I18n
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Username or Email', // TODO I18n
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) => setState(() => _email = text),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 5.0, left: 30.0, right: 30.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Server Url', // TODO I18n
                    hintText: 'Enter server Url', // TODO I18n
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) => setState(() => _serverUrl = text),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 15, bottom: 10),
                child: TextFormField(
                  obscureText: passToggle,
                  onChanged: (text) => setState(() => _password = text),
                  onEditingComplete: _email.isNotEmpty ? _submit : null,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password', // TODO I18n
                    hintText: 'Enter secure password', // TODO I18n
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 18.0),
                child: TextButton(
                  // TODO implement it! (need check if possible to change password etc. See rocketserver setting)
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password', // TODO I18n
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 70,
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                child: FilledButton(
                  onPressed: _email.isNotEmpty ? _submit : null,
                  child: const Text(
                    'Login', // I18n
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'New User? Create Account', // TODO I18n => verify if we can add it.
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
