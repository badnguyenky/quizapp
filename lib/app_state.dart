import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _TagList = prefs.getStringList('ff_TagList') ?? _TagList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _TagList = [
    'Arts',
    'Medicine',
    'Science',
    'Engineering',
    'Politics',
    'Business',
    'IT',
    'Entertainment',
    'UI/UX',
    'Tech',
    'Film',
    'Education',
    'Technology',
    'Actor',
    'Research',
    'Law',
    'Nonprofit',
    'CEO',
    'Finance',
    'Journalist',
    'Chemist',
    'Diplomat',
    'Military',
    'Producer'
  ];
  List<String> get TagList => _TagList;
  set TagList(List<String> value) {
    _TagList = value;
    prefs.setStringList('ff_TagList', value);
  }

  void addToTagList(String value) {
    TagList.add(value);
    prefs.setStringList('ff_TagList', _TagList);
  }

  void removeFromTagList(String value) {
    TagList.remove(value);
    prefs.setStringList('ff_TagList', _TagList);
  }

  void removeAtIndexFromTagList(int index) {
    TagList.removeAt(index);
    prefs.setStringList('ff_TagList', _TagList);
  }

  void updateTagListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    TagList[index] = updateFn(_TagList[index]);
    prefs.setStringList('ff_TagList', _TagList);
  }

  void insertAtIndexInTagList(int index, String value) {
    TagList.insert(index, value);
    prefs.setStringList('ff_TagList', _TagList);
  }

  bool _isLike = false;
  bool get isLike => _isLike;
  set isLike(bool value) {
    _isLike = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
