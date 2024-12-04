import 'dart:js' as js;

class RazorpayService {
  static void openCheckout(
      {required String orderId,
      required double amount,
      required String name,
      required String description,
      required String email,
      required String contact}) {
    js.context.callMethod('razorpayCheckout', [
      {
        'key': 'YOUR_RAZORPAY_KEY',
        'amount': (amount * 100).toInt(), // Razorpay works with paise
        'name': name,
        'description': description,
        'order_id': orderId,
        'prefill': {
          'email': email,
          'contact': contact,
        },
        'theme': {'color': '#F37254'},
      }
    ]);
  }
}
