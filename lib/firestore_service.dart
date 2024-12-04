import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTransactionDetails(
      Map<String, dynamic> transactionData) async {
    await _db.collection('transactions').add(transactionData);
  }
}

void onPaymentSuccess(response) {
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic> transactionData = {
    'payment_id': response['razorpay_payment_id'],
    'order_id': response['razorpay_order_id'],
    'signature': response['razorpay_signature'],
    'amount': response['amount'],
    'currency': response['currency'],
    'status': 'success',
    'created_at': DateTime.now(),
  };
  firestoreService.saveTransactionDetails(transactionData);
}
