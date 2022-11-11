import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

class SearchAPI {
  Future<List<userModel>?> searchfromFirebase(
      String? searchBy, String searchedItem) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    return userCollection.get().then((querysnapshot) {
      List<userModel> resultUser = [];
      for (var element in querysnapshot.docs) {
        final userData = element.data() as Map<String, dynamic>;
        final user = userModel.fromMap(userData);
        if (searchBy == 'Name') {
          if (user.name?.toLowerCase().contains(searchedItem.toLowerCase()) ??
              false) {
            resultUser.add(user);
          }
        }
        if (searchBy == 'Sangha') {
          if (user.sangha?.toLowerCase().contains(searchedItem.toLowerCase()) ??
              false) {
            resultUser.add(user);
          }
        } else if (searchBy == 'Blood Group') {
          if (user.bloodgroup
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultUser.add(user);
          }
        } else if (searchBy == 'City') {
          if (user.city?.toLowerCase().contains(searchedItem.toLowerCase()) ??
              false) {
            resultUser.add(user);
          }
        } else if (searchBy == 'Proffession') {
          if (user.proffesion
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultUser.add(user);
          }
        }
      }
      return resultUser;
    });
  }
}
