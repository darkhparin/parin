import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cwl/constants/local_storage_keys.dart';

class StorageLocalService {
  Future<String> getLoginCredentials() async {
    try {
      return await _getString(key: LoginResponceKey);
    } catch (e) {
      return null;
    }
  }

  Future<bool> setLoginCredentials({@required String credentials}) async {
    try {
      return await _setString(key: LoginResponceKey, value: credentials);
    } catch (e) {
      return null;
    }
  }

  Future<String> getDeviceId() async {
    try {
      return await _getString(key: DeviceIdKey);
    } catch (e) {
      return null;
    }
  }

  Future<bool> setDeviceId({@required String deviceId}) async {
    try {
      return await _setString(key: DeviceIdKey, value: deviceId);
    } catch (e) {
      return null;
    }
  }

  Future<bool> _setBool({@required String key, @required bool value}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        await preferences.remove(key);
        return await preferences.setBool(key, value);
      } else {
        return preferences.setBool(key, value);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> _setInt({@required String key, @required int value}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        await preferences.remove(key);
        return await preferences.setInt(key, value);
      } else {
        return await preferences.setInt(key, value);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> _setDouble(
      {@required String key, @required double value}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        await preferences.remove(key);
        return await preferences.setDouble(key, value);
      } else {
        return await preferences.setDouble(key, value);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> _setString(
      {@required String key, @required String value}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        await preferences.remove(key);
        return await preferences.setString(key, value);
      } else {
        return await preferences.setString(key, value);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> _setStringList(
      {@required String key, @required List<String> value}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        await preferences.remove(key);
        return await preferences.setStringList(key, value);
      } else {
        return await preferences.setStringList(key, value);
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> _get({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.get(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> _getBool({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.getBool(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<double> _getDouble({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.getDouble(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<int> _getInt({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.getInt(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> _getString({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.getString(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<String>> _getStringList({@required String key}) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey(key)) {
        return preferences.getStringList(key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
