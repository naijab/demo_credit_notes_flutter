import 'package:demo_credit_notes/widgets/credit_card.dart';

class CreditCardInfo {
  CreditCardType? type;
  String? name;
  String? bank;
  int? first4digit;
  int? last4digit;

  CreditCardInfo({
    this.type,
    this.name,
    this.bank,
    this.first4digit,
    this.last4digit,
  });
}
