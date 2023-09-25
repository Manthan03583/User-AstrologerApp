class Constants {
  static const googleApiKey = "AIzaSyCQ2PplFk6A16QPzWAngh2r3BFUeXckadY";
  static const placeholderImage =
      "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png";
  final razorpayapikey = "rzp_test_Jz2RXM3WN0Rg6j";    

  Map<String, dynamic> getRazorPayOptions(
      { required double amount}) {
    Map<String, dynamic> options = {
      'key': razorpayapikey,
      'amount': amount * 100,
      'order': {
        "id": "order_DaZlswtdcn9UNV",
        "entity": "order",
        "amount": amount * 100,
        "amount_paid": 0,
        "amount_due": 0,
        "currency": "INR",
        "receipt": "Receipt #20",
        "status": "created",
        "attempts": 0,
        "notes": [],
        "created_at": 1572502745,
      },
      'name': 'Edevlop Services',
      'description': 'first razorpay transaction',
      'timeout': 120,
      'currency': 'INR',
      'prefill': {
        'contact': '8144964109',
        'email': 'manthan.edevlop@gmail.com',
      }
    };

    return options;
  }
}
