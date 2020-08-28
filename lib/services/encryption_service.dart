import 'package:encrypt/encrypt.dart' as ecry;
import 'package:flutter/cupertino.dart';

class EncryptionService {
  final key = ecry.Key.fromUtf8('Y#Zz-b#4W-a^MCAKY#Zz-b#4W-a^MCAK');
  final iv = ecry.IV.fromLength(16);

  String encrypt({@required String plainText}) {
    final encrypter = ecry.Encrypter(ecry.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decrypt({@required String base64}) {
    final encrypter = ecry.Encrypter(ecry.AES(key));
    var encrypted = ecry.Encrypted.from64(base64);
    return encrypter.decrypt(encrypted, iv: iv);
  }
}
