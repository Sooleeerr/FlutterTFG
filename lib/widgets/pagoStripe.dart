/*import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PagoStripe extends StatefulWidget {
  const PagoStripe({Key? key}) : super(key: key);

  @override
  State<PagoStripe> createState() => _PagoStripeState();
}

class _PagoStripeState extends State<PagoStripe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Stripe.merchantIdentifier = "merchant.identifier";
    Stripe.publishableKey =
        "pk_test_51OHqU3LIc7uAGefDyYZhKejWmepGySjVKjSnsaudAf2C0VaUJ34kGwZmH4sTTH4dVHPR7QZalhpfCPIsw1z6avO4004VtmBUaC";
  }

  Future<void> initPaymentSheet() async {
    // 1. create payment intent on the server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stripe Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //
          },
          child: Text('Realizar Pago con PayPal'),
        ),
      ),
    );
  }
}
*/