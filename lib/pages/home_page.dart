import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:demo_credit_notes/view_models/home_page_model.dart';
import 'package:demo_credit_notes/widgets/balance.dart';
import 'package:demo_credit_notes/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _carCarouselController = CarouselController();
  final _addFormKey = GlobalKey<FormState>();
  final _titleTextController = TextEditingController();
  final _priceTextController = TextEditingController();

  @override
  void dispose() {
    _titleTextController.dispose();
    _priceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
      init: HomePageViewModel(),
      builder: (viewModel) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(
                height: 20,
              ),
              _buildCardList(viewModel.creditCardList, viewModel),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _paymentForm(context, viewModel);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
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

  Widget _buildCardList(
      List<CreditCardInfo> creditCards, HomePageViewModel viewModel) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: CarouselSlider.builder(
          itemCount: creditCards.length,
          itemBuilder: (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) {
            viewModel.currentCardId.update((val) => val = itemIndex);
            return CreditCard(info: creditCards[itemIndex]);
          },
          options: CarouselOptions(
            height: 200,
          ),
        ),
      ),
    );
  }

  _paymentForm(BuildContext ctx, HomePageViewModel viewModel) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Form(
          key: _addFormKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _titleTextController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    hintText: "what is your pay",
                    icon: Icon(Icons.edit),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceTextController,
                  decoration: const InputDecoration(
                    labelText: "Price",
                    hintText: "what price you have pay",
                    icon: Icon(Icons.money),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (_addFormKey.currentState?.validate() ?? false) {
                      final payment = CreditCardInfoPaymentHistory(
                        title: _titleTextController.text,
                        price: int.tryParse(_priceTextController.text) ?? 0,
                      );
                      viewModel.add(viewModel.currentCardId.value, payment);
                      _addFormKey.currentState?.reset();
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
