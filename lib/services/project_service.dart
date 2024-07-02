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
    required String userId,
    required String description,
    DateTime? dueDate,
  }) async {
    try {
      ProjectModel project = ProjectModel(
        name: name,
        userId: userId,
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

  Future<GenericResponse<void>> deleteProject({required String id}) async {
    try {
      await _fireStore.collection(_collectionName).doc(id).delete();
      return GenericResponse.success(null);
    } catch (e) {
      return GenericResponse.failure('Error deleting project: $e', 400);
    }
  }

  Future<GenericResponse<ProjectModel>> updateProject({
    required String id,
    String? name,
    String? category,
    String? status,
    String? description,
    DateTime? dueDate,
  }) async {
    try {
      Map<String, dynamic> updateData = {};

      if (name != null) updateData['name'] = name;
      if (category != null) updateData['category'] = category;
      if (description != null) updateData['description'] = description;
      if (dueDate != null) updateData['dueDate'] = dueDate.toString();
      if (status != null) updateData['status'] = status;

      await _fireStore.collection(_collectionName).doc(id).update(updateData);

      DocumentSnapshot doc =
          await _fireStore.collection(_collectionName).doc(id).get();
      ProjectModel updatedProject =
          ProjectModel.fromJson(doc.data() as Map<String, dynamic>);

      return GenericResponse.success(updatedProject);
    } catch (e) {
      return GenericResponse.failure('Error updating project: $e', 400);
    }
  }

  Future<List<ProjectModel>> getProjects({required String userId}) async {
    try {
      QuerySnapshot querySnapshot =
          await _fireStore.collection(_collectionName)
              .where('userId', isEqualTo: userId)
              .get();

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
