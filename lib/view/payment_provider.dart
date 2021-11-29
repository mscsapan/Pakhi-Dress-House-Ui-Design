import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../controller/heading_controller.dart';

class PaymentProvider extends StatelessWidget {
  final double picSize = 50.0;

  final List<String> image = [
    'https://www.kindpng.com/picc/m/235-2353460_mastercard-hd-png-download.png',
    'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Stripe_logo%2C_revised_2016.png/1200px-Stripe_logo%2C_revised_2016.png',
    'https://download.logo.wine/logo/BKash/BKash-bKash-Logo.wine.png',
    'https://seeklogo.com/images/D/dutch-bangla-rocket-logo-B4D1CC458D-seeklogo.com.png',
    'https://download.logo.wine/logo/Nagad/Nagad-Logo.wine.png',
    'https://www.pngitem.com/pimgs/m/170-1702087_delivery-in-hand-hand-delivery-icon-png-transparent.png',
  ];
  final List<String> title = [
    'Debit/Credit Card',
    'Stripe',
    'bKash',
    'Rocket',
    'Nagod',
    'Hands on Delivery'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: List.generate(
        title.length,
        (index) => AnimatedContainer(
          duration: Duration(seconds: 1),
          height: screenHeight * 0.12,
          width: double.infinity,
          child: Consumer<HeadingController>(
            builder: (context, controller, child) => GestureDetector(
              onTap: () => controller.checkPaymentOption(index),
              child: Card(
                margin: EdgeInsets.zero.copyWith(bottom: 5.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20.0,
                        width: 20.0,
                        margin: EdgeInsets.only(right: 6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueGrey),
                        child: Padding(
                            padding: EdgeInsets.all(
                                controller.cardPosition == index ? 1.0 : 0.0),
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.cardPosition == index
                                      ? Colors.blueGrey
                                      : Colors.white,
                                ),
                                child: FaIcon(FontAwesomeIcons.check,
                                    size: controller.cardPosition == index
                                        ? 12.0
                                        : 16.0,
                                    color: controller.cardPosition == index
                                        ? Colors.white
                                        : Colors.transparent))),
                      ),
                      SizedBox(
                          height: picSize,
                          width: picSize + 5.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.network(image[index],
                                  fit: BoxFit.fill,
                                  height: picSize,
                                  width: picSize + 5.0))),
                      SizedBox(width: 10.0),
                      Text(title[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 18.0,
                                  fontWeight: controller.cardPosition == index
                                      ? FontWeight.w600
                                      : FontWeight.normal))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
