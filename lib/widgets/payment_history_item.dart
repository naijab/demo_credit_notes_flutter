import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentHistoryItem extends StatelessWidget {
  static var formatter = NumberFormat('#,##,000');
  final CreditCardInfoPaymentHistory? item;
  final Function removeCallback;

  const PaymentHistoryItem({
    Key? key,
    required this.item,
    required this.removeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        if (item != null) {
          removeCallback();
        }
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item?.title ?? ""),
                  Text(
                    "฿ ${formatter.format(item?.price ?? 0)}",
                  ),
                ],
              ),
              subtitle: Text(
                DateFormat('dd MMM yy - kk:mm:a').format(
                  item?.createdAt ?? DateTime.now(),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
