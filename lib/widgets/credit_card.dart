import 'dart:math' as math;

import 'package:demo_credit_notes/config/assets.dart';
import 'package:demo_credit_notes/enum/credit_card_type.dart';
import 'package:demo_credit_notes/model/credit_card_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCard extends StatelessWidget {
  final CreditCardInfo? info;

  const CreditCard({
    Key? key,
    this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  (info?.type == CreditCardType.mastercard)
                      ? Colors.purple
                      : Colors.orange,
                  (info?.type == CreditCardType.mastercard)
                      ? Colors.blue
                      : Colors.pink,
                ],
                tileMode: TileMode.repeated,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    height: (info?.type == CreditCardType.mastercard) ? 30 : 20,
                    image: AssetImage(
                      _getCreditLogo(info?.type ?? CreditCardType.visa),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${info?.first4digit ?? 0000}  xxxx  xxxx  ${info?.last4digit ?? 0000}",
                  style: GoogleFonts.shareTech(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Card Holder",
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        info?.name ?? "No Name",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 22,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                info?.bank ?? "No Bank".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCreditLogo(CreditCardType type) {
    switch (type) {
      case CreditCardType.visa:
        return AppAssets.visacard;
      case CreditCardType.mastercard:
        return AppAssets.mastercard;
      default:
        return "";
    }
  }
}
