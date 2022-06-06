import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData (
      String name, String gender, int score, String uid) async {
    return await profileList
        .doc(uid)
        .set({'name': name, 'gender': gender, 'score': score});
  }

  Future updateUserList(String name, String gender, int score, String uid) async {
    return await profileList.doc(uid).update({
      'name': name, 'gender': gender, 'score': score
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await FirebaseFirestore.instance.collection("profileInfo").get().then((value) {
        for(var i in value.docs) {
          itemsList.add(i.data());
        }
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}