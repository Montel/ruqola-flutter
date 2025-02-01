/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import "dart:io";
import "package:tray_manager/tray_manager.dart";

class SystemTrayDesktop with TrayListener {
  @override
  Future<void> onTrayIconRightMouseDown() async {
    if (!Platform.isLinux) await trayManager.popUpContextMenu();
  }

  Future<void> initMenu() async {
    Menu menu = Menu(
      items: [
        // TODO add i18n
        MenuItem(label: "Quit", onClick: (_) => exit(0)),
      ],
    );
    await trayManager.setContextMenu(menu);
  }
}
