import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_money/data/UserData.dart';
import 'package:uuid/uuid.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Firebase instance
  final _db = FirebaseFirestore.instance;

  get friendId => null;

  Future<void> createUserAndFriend(UserData user) async {
    try {
      // // Generate a unique document ID for the user
      // var uuid = Uuid();
      // String userDocId = uuid.v4();

      // Reference collections
      CollectionReference users = _db.collection('Users');
      CollectionReference allFriends = _db.collection('All Friends');

      // Retrieve the highest current user ID
      QuerySnapshot snapshot = await users.orderBy('id', descending: true).limit(1).get();
      int generateId = (snapshot.docs.isNotEmpty
          ? int.tryParse(snapshot.docs.first['id'].toString()) ?? 0
          : 0) + 1;

      // Convert the generated ID to a string
      String id = generateId.toString();

      // Prepare user data
      Map<String, dynamic> userData = user.toJson().cast<String, dynamic>();

      // Add user data to the "Users" collection
      await users.doc(id).set({
        ...userData, // Include all user data
        'id': id,    // Assign the new ID as a string
        "created_at": FieldValue.serverTimestamp(),
      });

      // Add the friend to the "All Friends" collection
      DocumentSnapshot allFriendSnapshot = await allFriends.doc(id).get();
      if (!allFriendSnapshot.exists) {
        await allFriends.doc(id).set({
          "created_at": FieldValue.serverTimestamp(),
          "friendId": friendId,
          "email": "pr@gmail.com"
        });
      }

    } catch (error) {
      // Handle errors
      Get.snackbar(
        "Error",
        "Something went wrong, please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print("Error in createUserAndFriend: $error");
    }
  }

  /// Check if an email exists in the friends list of a specific user
  Future<bool> checkEmailExistsInFriendsList(String email) async {
    try {
      // Reference to the 'All Friends' collection
      CollectionReference allFriends = _db.collection('All Friends');

      // Query the collection to find a document with the specified email
      QuerySnapshot querySnapshot = await allFriends.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        print("Email ID exists in the All Friends table.");
        return true;
      } else {
        // UserRepository.instance.addFriendToGlobalAndUserList("1", "1");
        return false;
      }
    } catch (error) {
      print("Error checking email in Firestore collection: $error");
      return false;
    }
  }

  Future<void> addFriendAfterLogin(String friendEmail, String currentUserId) async {
    try {
      // Reference collections
      CollectionReference users = _db.collection('Users');
      CollectionReference allFriends = _db.collection('All Friends');

      print("currentUserId: $currentUserId");

      // Check if the friend's email exists in the "All Friends" collection
      QuerySnapshot friendSnapshot = await allFriends.where('email', isEqualTo: friendEmail).get();

      if (friendSnapshot.docs.isNotEmpty) {
        // Fetch the first matching friend document
        DocumentSnapshot friendData = friendSnapshot.docs.first;

        // Extract friend details
        Map<String, dynamic> friendDetails = friendData.data() as Map<String, dynamic>;

        // Fetch the current user document
        DocumentSnapshot currentUserSnapshot = await users.doc(currentUserId).get();
        if (!currentUserSnapshot.exists) {
          throw Exception("Current user not found in the Users table.");
        }

        // Update the current user's data to include the friend
        Map<String, dynamic> currentUserData = currentUserSnapshot.data() as Map<String, dynamic>;

        // Ensure the `friends` field is a list and add the new friend
        List<Map<String, dynamic>> friendsList = List<Map<String, dynamic>>.from(
            currentUserData['friends'] ?? []);

        // Check if the friend is already in the list
        bool isAlreadyFriend = friendsList.any((friend) => friend['email'] == friendEmail);
        if (isAlreadyFriend) {
          Get.snackbar(
            "Notice",
            "This email is already in your friends list.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange.withOpacity(0.1),
            colorText: Colors.orange,
          );
          return;
        }

        // Fetch server timestamp
        Timestamp currentTimestamp = Timestamp.now();

        // Add the friend details to the list
        friendsList.add({
          'id': friendData.id,
          'email': friendDetails['email'],
        });

        // Update the current user document with the updated friends list
        await users.doc(currentUserId).update({
          'friends': friendsList,
        });

        // Notify success
        Get.snackbar(
          "Success",
          "Friend added successfully.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      } else {
        // Notify that the email is not found in the "All Friends" collection
        Get.snackbar(
          "Not Found",
          "The provided email does not exist in the All Friends list.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      }
    } catch (error) {
      // Handle errors
      Get.snackbar(
        "Error",
        "Something went wrong, please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print("Error in addFriendAfterLogin: $error");
    }
  }}