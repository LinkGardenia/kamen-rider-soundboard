import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/rider.dart';
import '../data/sound_repository.dart';
import '../utils/constants.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _ids = [];
  List<String> get favoriteIds => List.unmodifiable(_ids);
  List<KamenRider> get favoriteRiders => _ids.map((id) => SoundRepository.getRiderById(id)).whereType<KamenRider>().toList();
  bool isFavorite(String id) => _ids.contains(id);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(AppConstants.keyFavorites);
    if (saved != null) { _ids.addAll(saved); notifyListeners(); }
  }

  Future<void> toggleFavorite(String id) async {
    _ids.contains(id) ? _ids.remove(id) : _ids.add(id);
    notifyListeners();
    (await SharedPreferences.getInstance()).setStringList(AppConstants.keyFavorites, _ids);
  }
}
