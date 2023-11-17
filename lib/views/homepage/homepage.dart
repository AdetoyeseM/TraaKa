// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traacka/initialize_singletons.dart';
import 'package:traacka/views/homepage/order_tracking.dart';
import 'package:traacka/views/widgets/app_icons.dart';
import 'package:traacka/views/widgets/bottom_sheet.dart';
import 'package:traacka/views/widgets/navigation.dart';
import 'package:traacka/views/widgets/shimmering_container.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import '../widgets/components/colors/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const OrderBottomSheet(),
      body: Column(
        children: [
          Stack(
            children: [
              const AppImage(
                imageName: "newMap.jpg",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                child: StreamBuilder<User?>(
                    stream: $google.usersDetails,
                    builder: (context, snapshot) {
                      return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 22),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12)),
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 32,
                                      child: AppImage(
                                        imageName: "A.svg",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hi, ${snapshot.data?.displayName}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff2F2E36)),
                                          ),
                                          const Text(
                                            "Your Order has been Placed, waiting for a vendor to accept your order",
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                const ShimmeringContainer(),
                                const SizedBox(
                                  height: 18,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navigateToPage(OrderTrackingScreen());
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Track your Order"),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                )
                              ]));
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
