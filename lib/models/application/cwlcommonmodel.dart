class CwlCommonModel {
  num _id;
  String _name;
  num _type;
  CwlCommonModel(this._id, this._name, this._type);

  num get id => _id;
  set id(num value) {
    _id = value;
  }

  String get name => _name;
  set name(String value) {
    name = value;
  }

  num get type => _type;
  set type(num value) {
    _type = value;
  }
}
