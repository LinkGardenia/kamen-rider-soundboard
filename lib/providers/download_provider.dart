import 'package:flutter/foundation.dart';

enum DownloadStatus { notDownloaded, downloading, completed }

class DownloadProvider extends ChangeNotifier {
  final Map<String, DownloadStatus> _status = {};
  final Set<String> _downloaded = {};
  Map<String, DownloadStatus> get statuses => Map.unmodifiable(_status);
  Set<String> get downloadedPacks => Set.unmodifiable(_downloaded);
  DownloadStatus getStatus(String id) => _status[id] ?? DownloadStatus.notDownloaded;
  bool isDownloaded(String id) => _downloaded.contains(id);

  Future<void> startDownload(String id) async {
    _status[id] = DownloadStatus.downloading; notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _status[id] = DownloadStatus.completed; _downloaded.add(id); notifyListeners();
  }
}
