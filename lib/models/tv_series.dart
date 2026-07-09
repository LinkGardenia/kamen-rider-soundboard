import 'rider.dart';

class TVSeries {
  final String id;
  final String title;
  final String yearRange;
  final String era;
  final String coverImagePath;
  final String logoPath;
  final String themeColorHex;
  final List<KamenRider> riders;

  const TVSeries({
    required this.id, required this.title, required this.yearRange,
    required this.era, required this.coverImagePath, required this.logoPath,
    required this.themeColorHex, this.riders = const [],
  });
}
