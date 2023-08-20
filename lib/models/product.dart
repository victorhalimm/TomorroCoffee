import 'package:flutter_qualif_vc/models/comment.dart';

class Product {
  final String title;
  final String imageUrl;
  final String description;
  final String detailDescription;
  final double price;

  List<Comment> comments;

  Product({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.detailDescription,
    required this.comments
  });
}