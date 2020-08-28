import 'package:flutter/material.dart';

class PartyAddParameter {
  final int _branchId;
  final String _branch;
  final String _gstin;
  final bool _isURP;
  final int _pincode;

  int get branchId => _branchId;
  String get branch => _branch;
  String get gstin => _gstin;
  bool get isURP => _isURP;
  int get pincode => _pincode;

  PartyAddParameter(
      {@required int branchId,
      @required String branch,
      @required String gstin,
      @required bool isURP,
      int pincode = 0})
      : _branchId = branchId,
        _branch = branch,
        _gstin = gstin,
        _isURP = isURP,
        _pincode = pincode;
}
