/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:provider/provider.dart';

/// TODO: update Account page to use account manager.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final secureStorage = context.read<SecureStorage>();
    final account = context.read<Rocketchataccount>();

    return FutureBuilder(
      future: secureStorage.readCredentials(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final credentials = snapshot.data;
          return LoginWidget(
            credentials: credentials,
            account: account,
          );
        }
      },
    );
  }
}

class LoginWidget extends StatefulWidget {
  final Credentials? credentials;
  final Rocketchataccount account;
  const LoginWidget({
    required this.credentials,
    required this.account,
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool get _validate => _formKey.currentState?.validate() ?? false;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _serverUrlController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.credentials?.username ?? '';
    _passwordController.text = widget.credentials?.password ?? '';
    _serverUrlController.text = widget.credentials?.url ?? '';

    // This is needed so that if credentials where
    // loaded from secure storage the form recognizes it.
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () => setState(() {}),
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username or Email', // TODO I18n
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Username or Email', // TODO I18n
                ),
                validator: _emptyValidator,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password', // TODO I18n
                  hintText: 'Enter secure password', // TODO I18n
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                    child: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: _emptyValidator,
              ),
              TextFormField(
                controller: _serverUrlController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server Url', // TODO I18n
                  hintText: 'Enter server Url', // TODO I18n
                ),
                validator: _uriValidator,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  FilledButton.tonal(
                    // TODO implement it! (need check if possible to change password etc. See rocketserver setting)
                    onPressed: () {},
                    child: Text(
                      'Forgot Password', // TODO I18n
                      style: TextStyle(
                        // TODO: decide on a color scheme.
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: _validate ? () async => _submit() : null,
                    child: Text(
                      'Login', // TODO I18n
                      style: TextStyle(
                        // TODO: decide on a color scheme.
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text(
                  'New User? Create Account', // TODO I18n => verify if we can add it.
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _emptyValidator(String? value) {
    if (value!.isEmpty) return "Can't be empty"; // TODO add i18n here
    return null; // return null if the text is valid
  }

  String? _uriValidator(String? value) {
    final empty = _emptyValidator(value);
    if (empty != null) return empty;

    final uri = Uri.tryParse(value!);
    if (uri == null || !uri.hasAbsolutePath) return "Can't parse url"; // TODO add i18n here

    return null;
  }

  void _submit() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final url = _serverUrlController.text;

    // Last validation check.
    if (!_validate) return;

    // Save credentials to secure storage.
    final credentials = Credentials(username: username, password: password, url: url);
    final secureStorage = context.read<SecureStorage>();

    // TODO: we can probably use some unique account identifier as the key.
    await secureStorage.writeCredentials(credentials);

    // Let the user know we are doing things....
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }

    widget.account.settings.setUserName = username;
    widget.account.settings.setPassword = password;
    widget.account.settings.setServerUrl = url;

    // TODO: this should return something on sucess or throw an Exception on failure.
    await widget.account.connect();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login Successful")),
    );
  }
}
