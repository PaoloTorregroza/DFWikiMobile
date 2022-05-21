// Controller
// Use Case

import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  final prefsController = SharedPreferences.getInstance();

  void addEntry(String page) async {
    final prefs = await prefsController;
    final current = await getEntries();

    // Check that entry is not already in list
    if (current.contains(page)) {
      return; // Uncheck
    }

    current.add(page);

    await prefs.setStringList('favorites', current);
  }

  void removeEntry() {}

  Future<List<String>> getEntries() async {
    final prefs = await prefsController;
    final current = prefs.getStringList('favorites');

    if (current == null) {
      return [];
    }

    return current;
  }
}
