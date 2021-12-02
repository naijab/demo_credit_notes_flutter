import 'package:demo_credit_notes/enum/credit_card_type.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:get/get.dart';

class HomePageViewModel extends GetxController {
  var creditCardList = <CreditCardInfo>[
    CreditCardInfo(
      id: 1,
      bank: "KBANK",
      type: CreditCardType.visa,
      name: "John Koner",
      first4digit: 4343,
      last4digit: 9191,
      usage: 0,
      available: 30000,
      paymentHistories: [],
    ),
    CreditCardInfo(
      id: 2,
      bank: "SCB",
      type: CreditCardType.mastercard,
      name: "John Koner",
      first4digit: 9293,
      last4digit: 4433,
      usage: 0,
      available: 20000,
      paymentHistories: [],
    ),
  ].obs;

  var currentCardId = 0.obs;

  void add(int creditId, CreditCardInfoPaymentHistory payment) {
    CreditCardInfo? creditCard = creditCardList.firstWhereOrNull(
      (element) => element.id == creditId,
    );

    if (creditCard == null) {
      return;
    }

    creditCard.paymentHistories?.add(payment);
  }
}
