import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ichat_app/allConstants/constants.dart';

class HomeProvider {
  final FirebaseFirestore firebaseFirestore;

  HomeProvider({
    required this.firebaseFirestore
});
  Future<void> updateDataFirestore(String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore.collection(collectionPath).doc(path).update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getStreamFireStore(String pathColleciton, int limit, String? textSearch) {
    if(textSearch?.isNotEmpty == true) {
      return firebaseFirestore.collection(pathColleciton).limit(limit).where(FirestoreConstants.nickname, isEqualTo:  textSearch).snapshots();

    }else {
      return firebaseFirestore.collection(pathColleciton).limit(limit).snapshots();
    }
  }
}