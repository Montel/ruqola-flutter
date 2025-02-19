/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';

class ChannelViewHeaderTile extends StatelessWidget {
  final String category;
  const ChannelViewHeaderTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
      tileColor: Colors.grey[200],
    );
  }
}
