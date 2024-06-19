import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:im_task_managment/models/domain/project_model.dart';
import 'package:im_task_managment/services/generic_response.dart';

class ProjectService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String _collectionName = 'projects';

  Future<GenericResponse<ProjectModel>> createProject({
    String? id,
    String? category,
    required String name,
    required String description,
    DateTime? dueDate,
  }) async {
    try {
      ProjectModel project = ProjectModel(
        name: name,
        category: category ?? "TI",
        description: description,
        dueDate: dueDate ?? DateTime.now(),
      );

      await _fireStore
          .collection(_collectionName)
          .doc(project.id)
          .set(project.toJson());

      return GenericResponse.success(project);
    } catch (e) {
      return GenericResponse.failure('Error creating project: $e', 400);
    }
  }

  Future<List<ProjectModel>> getProjects() async {
    try {
      QuerySnapshot querySnapshot =
          await _fireStore.collection(_collectionName).get();
      return querySnapshot.docs
          .map((doc) =>
              ProjectModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting projects: $e');
      throw e;
    }
  }
}
