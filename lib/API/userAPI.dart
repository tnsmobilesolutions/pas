import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/model/CompleteProfileModel.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

class UserAPI {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
//signUp
  emailSignUp(userModel currentUser, String? password) async {
    try {
      final userCredential = await auth
          .createUserWithEmailAndPassword(
              email: currentUser.email.toString(),
              password: password.toString())
          .then(
        (value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.userId)
              .set(
                currentUser.toMap(),
              );
          return value;
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Text('Email already is in use');
        // return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return const CircularProgressIndicator();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return UserCredential;
  }

//SIGNIN

  Future<userModel?> signIn(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => uid);

      final user = usercollection
          .where("uid", isEqualTo: userCredential?.user?.uid)
          .get()
          .then(
        (querySnapshot) {
          final userData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;
          final user = userModel.fromMap(userData);
          // _loggedInUser = user;
          return user;
        },
      );
      return user;

      //return uid.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        const Text('data');
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  // add data
  addcompleteProfileData(userModel addOnData) async {
    final email = FirebaseAuth.instance.currentUser?.email;
    final user = usercollection.where("email", isEqualTo: email).get().then(
      (querySnapshot) {
        final userData = querySnapshot.docs.first.id;
        usercollection.doc(userData).update(addOnData.toMap());
        // _loggedInUser = user;
      },
    );
  }

  // Fetch Profile Data
  Future<List<userModel>?> fetchprofile() {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');

    return userCollection.get().then(
      (querySnapshot) {
        List<userModel>? lstUsers = [];
        for (var element in querySnapshot.docs) {
          final userList = element.data() as Map<String, dynamic>;

          final user = userModel.fromMap(userList);

          lstUsers.add(user);
        }
        print('+++$lstUsers+++');
        return lstUsers;
      },
    );
  }

  //
  logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e); //
    }
  }
  //Fetch AddonData

  // Future<List<CompleteProfileModel>?> fetchprofileData() {
  //   final uid = FirebaseAuth.instance.currentUser?.uid;

  //   CollectionReference userCollection =
  //       FirebaseFirestore.instance.collection('users');

  //   return userCollection.get().then(
  //     (querySnapshot) {
  //       List<CompleteProfileModel>? lstUsers = [];
  //       for (var element in querySnapshot.docs) {
  //         final userDataList = element.data() as Map<String, dynamic>;

  //         final user = CompleteProfileModel.fromMap(userDataList);

  //         lstUsers.add(user);
  //       }
  //       print('+++$lstUsers+++');
  //       return lstUsers;
  //     },
  //   );
  // }
}
