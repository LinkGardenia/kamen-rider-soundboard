import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_manager.dart';
import 'providers/audio_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/download_provider.dart';
import 'screens/main_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tm = ThemeManager(); await tm.init();
  final fp = FavoritesProvider(); await fp.init();
  runApp(KamenRiderApp(tm: tm, fp: fp));
}

class KamenRiderApp extends StatelessWidget {
  final ThemeManager tm; final FavoritesProvider fp;
  const KamenRiderApp({super.key, required this.tm, required this.fp});

  @override Widget build(BuildContext context) => MultiProvider(providers: [
    ChangeNotifierProvider.value(value: tm),
    ChangeNotifierProvider.value(value: fp),
    ChangeNotifierProvider(create: (_) => AudioProvider()),
    ChangeNotifierProvider(create: (_) => DownloadProvider()),
  ], child: Consumer<ThemeManager>(builder: (ctx, t, _) => MaterialApp(
    title: '假面骑士音效板', theme: t.materialTheme,
    debugShowCheckedModeBanner: false, home: const MainScaffold(),
  )));
}
