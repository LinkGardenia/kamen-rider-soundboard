class DownloadPack {
  final String id;
  final String seriesId;
  final String riderId;
  final String riderName;
  final String description;
  final String thumbnailPath;
  final int fileSizeMB;
  final int soundCount;
  final String remoteUrl;

  const DownloadPack({
    required this.id, required this.seriesId, required this.riderId,
    required this.riderName, required this.description,
    required this.thumbnailPath, required this.fileSizeMB,
    required this.soundCount, required this.remoteUrl,
  });
}

class DownloadRegistry {
  DownloadRegistry._();

  static final List<DownloadPack> availablePacks = [
    DownloadPack(id: 'pack_kuuga', seriesId: 'kuuga', riderId: 'kuuga',
      riderName: '假面骑士空我 完整音效包', description: '空我全部5形态变身音效、必杀技、腰带音效及经典台词',
      thumbnailPath: 'assets/images/riders/kuuga.png', fileSizeMB: 28, soundCount: 25,
      remoteUrl: 'https://example.com/packs/kuuga.zip'),
    DownloadPack(id: 'pack_ryuki', seriesId: 'ryuki', riderId: 'ryuki',
      riderName: '假面骑士龙骑 完整音效包', description: '龙骑、夜骑、铁兵、王蛇等全部13位骑士完整音效',
      thumbnailPath: 'assets/images/riders/ryuki.png', fileSizeMB: 45, soundCount: 40,
      remoteUrl: 'https://example.com/packs/ryuki.zip'),
    DownloadPack(id: 'pack_faiz', seriesId: 'faiz', riderId: 'faiz',
      riderName: '假面骑士555 完整音效包', description: 'Faiz加速/爆裂形态、Kaixa、Delta全部音效',
      thumbnailPath: 'assets/images/riders/faiz.png', fileSizeMB: 32, soundCount: 30,
      remoteUrl: 'https://example.com/packs/faiz.zip'),
    DownloadPack(id: 'pack_decade', seriesId: 'decade', riderId: 'decade',
      riderName: '假面骑士Decade 完整音效包', description: '完全形态卡牌音效、各世界骑士召唤音效',
      thumbnailPath: 'assets/images/riders/decade.png', fileSizeMB: 50, soundCount: 45,
      remoteUrl: 'https://example.com/packs/decade.zip'),
    DownloadPack(id: 'pack_build', seriesId: 'build', riderId: 'build',
      riderName: '假面骑士Build 完整音效包', description: '全部最佳匹配形态音效、危险等级提升、天才形态',
      thumbnailPath: 'assets/images/riders/build.png', fileSizeMB: 40, soundCount: 38,
      remoteUrl: 'https://example.com/packs/build.zip'),
    DownloadPack(id: 'pack_zero_one', seriesId: 'zero_one', riderId: 'zero_one',
      riderName: '假面骑士Zero-One 完整音效包', description: '全部Progrise Key音效、Zero-Two变身',
      thumbnailPath: 'assets/images/riders/zero_one.png', fileSizeMB: 38, soundCount: 35,
      remoteUrl: 'https://example.com/packs/zero_one.zip'),
    DownloadPack(id: 'pack_geats', seriesId: 'geats', riderId: 'geats',
      riderName: '假面骑士Geats 完整音效包', description: '全部带扣音效、Desire Driver音效集、Geats IX',
      thumbnailPath: 'assets/images/riders/geats.png', fileSizeMB: 42, soundCount: 40,
      remoteUrl: 'https://example.com/packs/geats.zip'),
    DownloadPack(id: 'pack_gotchard', seriesId: 'gotchard', riderId: 'gotchard',
      riderName: '假面骑士Gotchard 完整音效包', description: '全部Chemy卡牌音效、GotchaDriver完整版',
      thumbnailPath: 'assets/images/riders/gotchard.png', fileSizeMB: 36, soundCount: 34,
      remoteUrl: 'https://example.com/packs/gotchard.zip'),
  ];

  static List<DownloadPack> getAllPacks() => availablePacks;
}
