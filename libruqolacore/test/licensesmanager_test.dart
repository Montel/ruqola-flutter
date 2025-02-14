/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  final licensesmanager = libruqolacore.LicensesManager();
  group('Licenses Info', () {
    test('Test Initial Licenses Info values', () {
      expect(licensesmanager.licenses.isEmpty, true);
    });

    test('test1 json', () {
      final data = extractJsonData("licensesmanager", "test1.json");

      final f = libruqolacore.LicensesManager();
      f.parseLicenses(data);
      final List<String> licenses = [
        "auditing",
        "canned-responses",
        "ldap-enterprise",
        "livechat-enterprise",
        "voip-enterprise",
        "omnichannel-mobile-enterprise",
        "engagement-dashboard",
        "push-privacy",
        "scalability",
        "teams-mention",
        "saml-enterprise",
        "oauth-enterprise",
        "device-management",
        "federation",
        "videoconference-enterprise",
        "message-read-receipt",
        "outlook-calendar",
        "hide-watermark",
        "custom-roles",
        "accessibility-certification"
      ];

      expect(f.licenses, licenses);
    });
  });
}
