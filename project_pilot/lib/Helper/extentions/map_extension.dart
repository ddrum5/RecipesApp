extension MapParse on Map {
  String getString(String key) {
    final value = this[key];
    if (value != null && value is String) {
      return value;
    }
    return '';
  }

  int getInt(String key) {
    final value = this[key];
    if (value != null && value is int) {
      return value;
    }
    return 0;
  }

  double getDouble(String key) {
    final value = this[key];
    if (value != null && value is double) {
      return value;
    }
    return 0.0;
  }

  bool getBool(String key) {
    final value = this[key];
    if (value != null && value is bool) {
      return value;
    }
    return false;
  }

  List<dynamic> getList(String key) {
    final value = this[key];
    if (value != null && value is List) {
      return value;
    }
    return [];
  }

  Map<String, dynamic> getMap(String key) {
    final value = this[key];
    if (value != null && value is Map) {
      return value as Map<String, dynamic>;
    }
    return {};
  }
}

