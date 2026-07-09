class RiderForm {
  final String id;
  final String name;
  final String riderId;
  final String imagePath;
  final String? description;
  final int sortOrder;

  const RiderForm({
    required this.id, required this.name, required this.riderId,
    required this.imagePath, this.description, this.sortOrder = 0,
  });
}
