import 'rider_form.dart';

class KamenRider {
  final String id;
  final String name;
  final String seriesId;
  final String imagePath;
  final String symbolPath;
  final String colorHex;
  final List<RiderForm> forms;

  const KamenRider({
    required this.id, required this.name, required this.seriesId,
    required this.imagePath, required this.symbolPath,
    required this.colorHex, this.forms = const [],
  });
}
