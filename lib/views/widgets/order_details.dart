
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, this.title, this.description});

  final String? title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: const TextStyle(
                color: Color(0xffB8B8B8),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          Text(
            description!,
            style: const TextStyle(
                color: Color(0xff2F2E36),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
