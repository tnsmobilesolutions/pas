import 'package:authentication/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prabasi_anchalika_sangha/model/CompleteProfileModel.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

class SearchAPI {
  Future<List<userModel>?> searchByName(
      String? searchBy, String searchedItem) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    return userCollection.get().then((querysnapshot) {
      List<userModel> resultMedicines = [];
      for (var element in querysnapshot.docs) {
        final userData = element.data() as Map<String, dynamic>;
        final user = userModel.fromMap(userData);

        if (searchBy == 'Name') {
          if (user.name?.toLowerCase().contains(searchedItem.toLowerCase()) ??
              false) {
            resultMedicines.add(user);
          }
        }
      }
      return resultMedicines;
    });
  }

//Search by addOnData
  Future<List<CompleteProfileModel>?> searchByAddOn(
      String? searchBy, String searchedItem) {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    return userCollection.get().then((querysnapshot) {
      List<CompleteProfileModel> resultMedicines = [];
      for (var element in querysnapshot.docs) {
        final addOnData = element.data() as Map<String, dynamic>;
        final userSpecific = CompleteProfileModel.fromMap(addOnData);
        if (searchBy == 'Sangha') {
          if (userSpecific.sangha
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultMedicines.add(userSpecific);
          }
        } else if (searchBy == 'Blood Group') {
          if (userSpecific.bloodgroup
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultMedicines.add(userSpecific);
          }
        } else if (searchBy == 'City') {
          if (userSpecific.city
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultMedicines.add(userSpecific);
          }
        } else if (searchBy == 'Proffession') {
          if (userSpecific.proffesion
                  ?.toLowerCase()
                  .contains(searchedItem.toLowerCase()) ??
              false) {
            resultMedicines.add(userSpecific);
          }
        }
      }
      return resultMedicines;
    });
  }
}
