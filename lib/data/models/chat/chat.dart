import 'package:cloud_firestore/cloud_firestore.dart';

final firestoreInstance = FirebaseFirestore.instance;

// Gửi tin nhắn
void sendMessage(String message) {
  firestoreInstance.collection("messages").add({
    'text': message,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

// Đọc tin nhắn
void readMessages() {
  firestoreInstance.collection("messages").get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print('Data: ${doc.data()}');
    });
  });
}
