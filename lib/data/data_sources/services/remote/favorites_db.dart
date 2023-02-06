/*import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static final instance = FirebaseUtils._();

  final _firebase = FirebaseFirestore.instance;

  Future<void> setDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebase.doc(path);
    return await reference.set(data);
  }

  Future<void> deleteDocument({required String path}) async {
    ///path be like ['products/product.id'] where product is an obj
    final reference = _firebase.doc(path);
    return await reference.delete();
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documntID) builder,
  }) {
    final reference = _firebase.doc(path);
    final snapshot = reference.snapshots();

    ///that fetch document COLLECTIONS [collections in one doc ];
    return snapshot.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String docId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    ///that fetch collection DOCS [docs in one collection];
    ///we pass path with odd / [ex:'products/']

    Query reference = _firebase.collection(path);
    if (queryBuilder != null) {
      reference = queryBuilder(reference);
    }
    final snapshot = reference.snapshots();

    return snapshot.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snap) => builder(snap.data() as Map<String, dynamic>, snap.id),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}

///how to use: in viewModel
///

class VieModel {
  ///note::: for acssecc collection we use  /
  ///note::: for acssess one doc we use collection/$id

  final firebase = FirebaseUtils.instance;

  Future<void> addTaskToFireStore(Task task) async {
    return await firebase.setDocument(
        path: 'tasks/${task.id}', data: task.toJson());

    /// if not work try 'tasks/${task.id}[/]'
  }

  Future<void> deleteTask(Task task) async {
    return await firebase.deleteDocument(path: 'tasks/${task.id}');
  }

  /// fetching docs data without any query
  Stream<List<Task>> fetchAllTasks() {
    return firebase.collectionStream(
      path: 'tasks/',
      builder: (data, docId) {
        return Task.fromJson(data!, docId);
      },
    );
  }

  ///fetching docs data with query
  Stream<List<Task>> fetchAllTasksWithCondition() {
    return firebase.collectionStream(
      path: 'tasks/',
      builder: (data, docId) => Task.fromJson(data!, docId),
      queryBuilder: (query) => query.where('name', isEqualTo: 'plapla'),
    );
  }
}

class Task {
  String id;
  String name;

  Task({required this.id, required this.name});

  Task.fromJson(Map<String, dynamic> json, String docID)

      ///important note in from we pass the json and DOC ID
      : this(
          id: docID,
          name: json['name'],
        );

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

/// in view
// child: StreamBuilder<List<Product>>(/////////////
// stream: viewModel.fetchAllTasksWithCondition(),
// builder: (context, snapshot) {
// if (snapshot.connectionState ==
// ConnectionState.active) {
// final products = snapshot.data;//////
// if (products == null) {
// return Center(
// child: Text('no data'),
// );
// }
// return ListView.builder(
// itemCount: products.length,
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
// child: ProductItem(product: products[index]),
// );
// },
// );
// } else {
// return Center(child: CircularProgressIndicator());
// }
// }),
*/