import 'package:im_task_managment/models/domain/projects_status.dart';
import 'package:uuid/uuid.dart';

class ProjectModel {
  final String id;
  final String userId;
  final String name;
  final String category;
  final String status;
  final String description;
  final DateTime dueDate;
  final DateTime createdAt;

  ProjectModel({
    String? id,
    String? status,
    DateTime? createdAt,
    required this.userId,
    required this.name,
    required this.category,
    required this.description,
    required this.dueDate,
  })  : id = id ?? const Uuid().v4(),
        status = status ?? ProjectStatus.notStarted,
        createdAt = createdAt ?? DateTime.now();

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? const Uuid().v4(),
      name: json['name'] ?? '',
      userId: json['userId'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'] ?? ProjectStatus.notStarted,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'category': category,
      'status': status,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
