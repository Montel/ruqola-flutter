/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';

class SearchChannelLine extends StatelessWidget {
  SearchChannelLine({
    super.key,
  });

  final _controller = TextEditingController();
  void clearLine() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search Channel', // I18n!
          suffixIcon: IconButton(
            onPressed: clearLine,
            icon: const Icon(Icons.clear),
          ),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ));
  }
}
