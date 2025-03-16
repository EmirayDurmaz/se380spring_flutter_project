import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add data to Firestore
  Future<void> addFUser(String name, int password) async {
    await _firestore.collection('Users').add({
      'UserName': name,
      'Password': password,
    });
    print("New user added: $name");
  }

  // Fetch all fruits from Firestore
  Future<List<Map<String, dynamic>>> fetchFruits() async {
    QuerySnapshot snapshot = await _firestore.collection('Users').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}

