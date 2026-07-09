import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_manager.dart';
import '../../data/download_registry.dart';
import '../../providers/download_provider.dart';

class DownloadHome extends StatelessWidget {
  const DownloadHome({super.key});

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    final dp = context.watch<DownloadProvider>();
    return Scaffold(backgroundColor: theme.colors.background,
      appBar: AppBar(title: Text('音效下载', style: TextStyle(fontFamily: theme.typography.titleFontFamily, fontSize: 24, fontWeight: FontWeight.w900, color: theme.colors.accent)), backgroundColor: theme.colors.background, elevation: 0),
      body: ListView.builder(padding: const EdgeInsets.all(16), itemCount: DownloadRegistry.getAllPacks().length, itemBuilder: (ctx, i) {
        final p = DownloadRegistry.getAllPacks()[i]; final s = dp.getStatus(p.id);
        return Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: theme.colors.accent.withOpacity(0.3), width: 2), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), offset: const Offset(3, 3), blurRadius: 0)]),
          child: Row(children: [
            Container(width: 56, height: 56, decoration: BoxDecoration(color: theme.colors.accent.withOpacity(0.15), borderRadius: BorderRadius.circular(12), border: Border.all(color: theme.colors.accent.withOpacity(0.4), width: 2)), child: Icon(Icons.music_note, color: theme.colors.accent, size: 28)),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.riderName, style: TextStyle(fontFamily: theme.typography.accentFontFamily, fontSize: 15, fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
              const SizedBox(height: 4),
              Text(p.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: theme.colors.textSecondary)),
              const SizedBox(height: 6),
              Text('${p.soundCount}个音效 · ${p.fileSizeMB}MB', style: TextStyle(fontSize: 11, color: theme.colors.textSecondary)),
            ])),
            s == DownloadStatus.completed ? Icon(Icons.check_circle, color: theme.colors.accent, size: 32) : s == DownloadStatus.downloading ? const SizedBox(width: 32, height: 32, child: CircularProgressIndicator(strokeWidth: 3)) : GestureDetector(onTap: () => dp.startDownload(p.id), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration(color: theme.colors.accent, borderRadius: BorderRadius.circular(25)), child: const Text('下载', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
          ]));
      }));
  }
}
