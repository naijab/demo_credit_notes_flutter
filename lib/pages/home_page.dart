import 'package:demo_credit_notes/config/assets.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:demo_credit_notes/widgets/balance.dart';
import 'package:demo_credit_notes/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CreditCardInfo> mockCreditCard = [
    CreditCardInfo(
      bank: "KBANK",
      type: CreditCardType.visa,
      name: "John Koner",
      first4digit: 4343,
      last4digit: 9191,
    ),
    CreditCardInfo(
      bank: "SCB",
      type: CreditCardType.mastercard,
      name: "John Koner",
      first4digit: 9293,
      last4digit: 4433,
    ),
  ];

  // TODO: Convert to MVVM Pattern
  // TODO: Can save new credit card
  // TODO: Can Save payment history of credit card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(
              height: 20,
            ),
            _buildCardList(),
            const SizedBox(
              height: 5,
            ),
            _buildBalance(),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child: const Text(
        "All cards",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCardList() {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mockCreditCard.length,
          itemBuilder: (ctx, index) {
            final info = mockCreditCard[index];
            return CreditCard(info: info);
          },
        ),
      ),
    );
  }

  Widget _buildBalance() {
    return const Balance();
  }
}
