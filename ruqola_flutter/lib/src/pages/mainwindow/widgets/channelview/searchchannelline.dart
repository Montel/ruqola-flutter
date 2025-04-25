/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';

class SearchChannelLine extends StatelessWidget {
  SearchChannelLine({
    super.key,
  });

  final _controller = TextEditingController();
  void _clearLine() {
    _controller.clear();
  }

  void _onTextChanged(String text) {
    SharedValue.filterChannel.value = text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: _onTextChanged,
        decoration: InputDecoration(
          labelText: 'Search Channel', // I18n!
          suffixIcon: IconButton(
            onPressed: _clearLine,
            icon: const Icon(Icons.clear),
          ),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ));
  }
}
