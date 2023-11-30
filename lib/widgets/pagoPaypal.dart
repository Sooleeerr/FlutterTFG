/*import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class PagoPaypal extends StatefulWidget {
  const PagoPaypal({Key? key}) : super(key: key);

  @override
  State<PagoPaypal> createState() => _PagoPaypalState();
}

class _PagoPaypalState extends State<PagoPaypal> {
  Future<void> initiatePayment() async {
    UsePaypal(
        sandboxMode: true,
        clientId:
            "AfKCpKqE4Qg3OID-vZDIuRUZbj_ra0vjI8w3EbawrpSl9bfHRewDP0MKv_9LeeUi6KzoO9OpAzv99jh9",
        secretKey:
            "EDWGtbBJHIlpFjlQQUcMl8P4YoJM9i55ZFup3WGFJV0t0ndo-Y7C5Tsz418jxojvuvAESCsguVtTv66l",
        returnURL: "mundomoviltfg://payment_success",
        cancelURL: "mundomoviltfg://payment_cancel",
        transactions: const [
          {
            "amount": {
              "total": '10.12',
              "currency": "USD",
              "details": {
                "subtotal": '10.12',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "A demo product",
                  "quantity": 1,
                  "price": '10.12',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              "shipping_address": {
                "recipient_name": "Jane Foster",
                "line1": "Travis County",
                "line2": "",
                "city": "Austin",
                "country_code": "US",
                "postal_code": "73301",
                "phone": "+00000000",
                "state": "Texas"
              },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
        },
        onCancel: (params) {
          print('cancelled: $params');
        });
  }

  _realizarPago() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('PayPal Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //initiatePayment();
            _realizarPago();
          },
          child: Text('Realizar Pago con PayPal'),
        ),
      ),
    );
  }
}
*/