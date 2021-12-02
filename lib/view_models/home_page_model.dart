import 'package:demo_credit_notes/enum/credit_card_type.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:get/get.dart';

class HomePageViewModel extends GetxController {
  var creditCard = CreditCardInfo(
    id: 1,
    bank: "KBANK",
    type: CreditCardType.visa,
    name: "John Koner",
    first4digit: 4343,
    last4digit: 9191,
    usage: 0,
    available: 30000,
    paymentHistories: [],
  ).obs;

  var currentCardId = 0.obs;

  void add(CreditCardInfoPaymentHistory payment) {
    creditCard.value.paymentHistories?.add(payment);
    creditCard.value.usage =
        (payment.price ?? 0) + (creditCard.value.usage ?? 0);
    creditCard.value.available =
        (creditCard.value.available ?? 0) - (creditCard.value.usage ?? 0);
    creditCard.refresh();
  }
}
