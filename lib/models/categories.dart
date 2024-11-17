
import '../assets.dart';

class Category {
  String title;
  String imagePath;
  Category({
    required this.title,
    required this.imagePath,
  });
}

final List<Category> categories = [
  Category(title: "General", imagePath: Assets.gavel),
  Category(title: "Family", imagePath: Assets.family),
  Category(title: "Criminal", imagePath: Assets.criminal),
];
