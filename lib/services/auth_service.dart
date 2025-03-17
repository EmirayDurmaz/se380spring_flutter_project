import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register User Data in Firestore
  Future<void> addUser(String name, String password) async {
    try {
      await _firestore.collection('Users').add({
        'UserName': name,
        'Password': password,
      });
      print("New user added: $name");
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  // Login User Data in Firestore
  Future<bool> loginUser(String name, String password) async {
    try {
      QuerySnapshot query = await _firestore
          .collection('Users')
          .where('UserName', isEqualTo: name) // Find user by name
          .get();

      if (query.docs.isNotEmpty) {
        var userData = query.docs.first.data() as Map<String, dynamic>;

        // Check if password matches
        if (userData['Password'] == password) {
          print("Login successful!");
          return true;
        } else {
          print("Incorrect password.");
          return false;
        }
      } else {
        print("User not found.");
        return false;
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }
}
