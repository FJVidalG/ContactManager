import 'package:flutter/material.dart';

IconData getIconLabel(List<String> labels) {
  if (labels.isEmpty) return Icons.account_circle;

  List<String> lowerLabels =
      labels.map((label) => label.toLowerCase()).toList();

  switch (lowerLabels.first) {
    case "trabajo":
      return Icons.business;
    case "familia":
      return Icons.family_restroom;
    case "pareja":
      return Icons.favorite;
    case "gimnasio":
      return Icons.fitness_center;
    case "amigo":
      return Icons.tag_faces;
    case "familia":
      return Icons.family_restroom;
    default:
      return Icons.question_mark;
  }
}
