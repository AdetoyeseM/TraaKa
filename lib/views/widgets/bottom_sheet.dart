import 'package:flutter/material.dart';
import 'package:traacka/views/widgets/app_icons.dart';
import 'package:traacka/views/widgets/components/colors/colors.dart';
import 'package:traacka/views/widgets/components/extensions/extensions.dart';
import 'package:traacka/views/widgets/order_details.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      height: 284,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 2,
              width: 72,
              color: const Color(0xffb8b8b8),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(color: Color(0xffEAFAEB)),
            child: const Text(
              "Your Order",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4CAF50)),
            ),
          ),
          const OrderDetails(
            title: "Order ID:",
            description: "#45678987",
          ),
          OrderDetails(
            title: "Order Date:",
            description: DateTime.now().toFormattedString(),
          ),
          const OrderDetails(title: "Order Type:", description: "Instant"),
          Divider(
            color: const Color(0xffD9D9D9).withOpacity(.4),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              AppImage(
                imageName: "A.svg",
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Crisp Fried Chicken Wrap x1",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2F2E36)),
                  ),
                  Row(
                    children: [
                      Text(
                        "Jollof rice x1",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xffF2AB58),
                      )
                    ],
                  )
                ],
              ),
              Spacer(),
              Text(
                "₦5000",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2F2E36)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
