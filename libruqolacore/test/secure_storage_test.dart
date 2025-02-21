import 'package:libruqolacore/src/secure_storage/credentials.dart';
import 'package:libruqolacore/src/secure_storage/secure_storage.dart';
import 'package:test/test.dart';

void main() {
  group('Secure Storage', () {
    final secureStorage = MockSecureStorage();
    final testCredentials = Credentials(
      username: "General Kenobi",
      password: "HelloThere",
      uri: Uri.parse("https://apps.kde.org/en-gb/ruqola/"),
    );

    test('Write', () async {
      await expectLater(
        secureStorage.writeCredentials(testCredentials),
        completes,
      );
    });

    test('Read - testCredentials', () async {
      expect(await secureStorage.readCredentials(), testCredentials);
    });

    test('Delete - testCredentials', () async {
      await expectLater(
        secureStorage.deleteCredentials(),
        completes,
      );
    });

    test('Read - null', () async {
      expect(await secureStorage.readCredentials(), null);
    });

    test('Delete - null', () async {
      await expectLater(secureStorage.deleteCredentials(), completes);
    });
  });
}
