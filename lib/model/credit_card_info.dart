import 'package:demo_credit_notes/enum/credit_card_type.dart';
import 'package:flutter/widgets.dart';

class CreditCardInfoPaymentHistory {
  String id = UniqueKey().toString();
  String? title;
  int? price;
  DateTime? createdAt = DateTime.now();

  CreditCardInfoPaymentHistory({
    this.title,
    this.price,
  });
}

class CreditCardInfo {
  int? id;
  CreditCardType? type;
  String? name;
  String? bank;
  int? first4digit;
  int? last4digit;
  int? usage;
  int? available;
  List<CreditCardInfoPaymentHistory>? paymentHistories;

  CreditCardInfo({
    this.id,
    this.type,
    this.name,
    this.bank,
    this.first4digit,
    this.last4digit,
    this.usage,
    this.available,
    this.paymentHistories,
  });
}
