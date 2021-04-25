import 'package:meta/meta.dart' show required;

class SkateModel {
  SkateModel({
    @required this.title,
    @required this.subtitle,
    @required this.details,
    @required this.path,
    @required this.price,
  });

  final String title;
  final String subtitle;
  final String details;
  final String path;
  final num price;
}
