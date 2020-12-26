class Country {
  String _name;
  String _capital;
  List _domain;
  String _continents;
  String _subregion;
  int _populations;
  int _area_km;
  String _flag;
  List _languages;
  Country(
      this._name,
      this._capital,
      this._domain,
      this._continents,
      this._subregion,
      this._populations,
      this._area_km,
      this._flag,
      this._languages);

  List get languages => _languages;

  set languages(List value) {
    _languages = value;
  }

  String get flag => _flag;

  set flag(String value) {
    _flag = value;
  }

  int get area_km => _area_km;

  set area_km(int value) {
    _area_km = value;
  }

  int get populations => _populations;

  set populations(int value) {
    _populations = value;
  }

  String get subregion => _subregion;

  set subregion(String value) {
    _subregion = value;
  }

  String get continents => _continents;

  set continents(String value) {
    _continents = value;
  }

  List get domain => _domain;

  set domain(List value) {
    _domain = value;
  }

  String get capital => _capital;

  set capital(String value) {
    _capital = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}