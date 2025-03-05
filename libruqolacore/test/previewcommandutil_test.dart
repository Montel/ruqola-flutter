/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Preview Util Command', () {
    test('Test load Preview Commands', () {
      {
        final data = extractJsonData("previewcommandutil", "empty.json");
        final List<PreviewCommand> previewCommands = PreviewCommandUtil.fromJson(data);
        final List<PreviewCommand> expectedPreviewCommands = [];
        expect(previewCommands, expectedPreviewCommands);
      }
      {
        final data = extractJsonData("previewcommandutil", "test1.json");
        final List<PreviewCommand> previewCommands = PreviewCommandUtil.fromJson(data);
        List<PreviewCommand> expectedPreviewCommands = [];
        {
          final PreviewCommand command = PreviewCommand(
              id: "xUPGcJeEA1aYVxPRbG",
              value:
                  "https://media3.giphy.com/media/v1.Y2lkPWM1NTZmMmE3Nzd5eHRtNXp6eWFicWd6ZzQzcG5xeHUwOG0wbXF4bnNrcnhjbnA4eiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/xUPGcJeEA1aYVxPRbG/100.gif",
              type: TypePreview.image);

          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "l3V0x6kdXUW9M4ONq",
              value:
                  "https://media1.giphy.com/media/v1.Y2lkPWM1NTZmMmE3Nzd5eHRtNXp6eWFicWd6ZzQzcG5xeHUwOG0wbXF4bnNrcnhjbnA4eiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/l3V0x6kdXUW9M4ONq/100.gif",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "MXLOctGsM4ppUjev31",
              value:
                  "https://media4.giphy.com/media/v1.Y2lkPWM1NTZmMmE3Nzd5eHRtNXp6eWFicWd6ZzQzcG5xeHUwOG0wbXF4bnNrcnhjbnA4eiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/MXLOctGsM4ppUjev31/100.gif",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }

        {
          final PreviewCommand command = PreviewCommand(
              id: "xUA7b2S7SxhM1cGdsQ",
              value:
                  "https://media3.giphy.com/media/xUA7b2S7SxhM1cGdsQ/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }

        {
          final PreviewCommand command = PreviewCommand(
              id: "RE5iREBNhI0Ok",
              value:
                  "https://media2.giphy.com/media/RE5iREBNhI0Ok/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "3o85xsGXVuYh8lM3EQ",
              value:
                  "https://media2.giphy.com/media/3o85xsGXVuYh8lM3EQ/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "Lsvn3qrOAo8RKdziTf",
              value:
                  "https://media3.giphy.com/media/Lsvn3qrOAo8RKdziTf/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "13SogtMD6cSqas",
              value:
                  "https://media2.giphy.com/media/13SogtMD6cSqas/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "y1GgSNQgd1Jx6",
              value:
                  "https://media3.giphy.com/media/y1GgSNQgd1Jx6/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        {
          final PreviewCommand command = PreviewCommand(
              id: "riwAaDlaA3zQQ",
              value:
                  "https://media0.giphy.com/media/riwAaDlaA3zQQ/100.gif?cid=c556f2a777yxtm5zzyabqgzg43pnqxu08m0mqxnskrxcnp8z&ep=v1_gifs_search&rid=100.gif&ct=g",
              type: TypePreview.image);
          expectedPreviewCommands.add(command);
        }
        expect(previewCommands, expectedPreviewCommands);
      }
    });
  });
}
