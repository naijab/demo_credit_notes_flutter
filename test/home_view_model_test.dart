import 'package:demo_credit_notes/enum/credit_card_type.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:demo_credit_notes/view_models/home_page_model.dart';
import 'package:demo_credit_notes/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Home view model can add new payment history', () {
    final viewModel = HomePageViewModel();

    final payment1 = CreditCardInfoPaymentHistory(title: "Food", price: 200);
    viewModel.add(payment1);

    final payment2 = CreditCardInfoPaymentHistory(title: "TMN", price: 50);
    viewModel.add(payment2);

    expect(viewModel.creditCard.value.paymentHistories?.length, 2);

    expect(viewModel.creditCard.value.available ?? 0, 29750);
    expect(viewModel.creditCard.value.usage ?? 0, 250);
  });

  test('Home view model can remove old payment history', () {
    final viewModel = HomePageViewModel();

    final payment1 = CreditCardInfoPaymentHistory(title: "Food", price: 200);
    viewModel.add(payment1);

    final payment2 = CreditCardInfoPaymentHistory(title: "TMN", price: 50);
    viewModel.add(payment2);

    expect(viewModel.creditCard.value.paymentHistories?.length, 2);

    viewModel.remove(payment1);
    expect(viewModel.creditCard.value.paymentHistories?.length, 1);

    expect(viewModel.creditCard.value.available ?? 0, 29950);
    expect(viewModel.creditCard.value.usage ?? 0, 50);
  });

  testWidgets('CreditCard Widget has credit info', (WidgetTester tester) async {
    final info = CreditCardInfo(
      id: 1,
      bank: "KBANK",
      type: CreditCardType.visa,
      name: "John Koner",
      first4digit: 4343,
      last4digit: 9191,
      usage: 0,
      available: 30000,
      paymentHistories: [],
    );

    final testWidget = MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: CreditCard(
          info: info,
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    // Create the Finders.
    final nameFinder = find.text('John Koner');
    final bankFinder = find.text('KBANK');

    expect(nameFinder, findsOneWidget);
    expect(bankFinder, findsOneWidget);
  });
}
