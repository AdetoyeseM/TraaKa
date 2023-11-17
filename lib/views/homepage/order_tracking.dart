import 'package:flutter/material.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:traacka/view_models/ably/ably_request.dart';
import 'package:traacka/views/widgets/components/colors/colors.dart';
import 'package:traacka/views/widgets/steps.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int currentStep = 0;
  List<Step> steps = [];

  @override
  void initState() {
    super.initState();
    AblyRequest().createAblyRealtimeInstance();
    subscribeToOrderStatusUpdates();
    initializeSteps();
  }

  void initializeSteps() {
    steps = [
      const Step(
          title: CustomStep(
            title: 'Order Placed',
            content: 'Waiting for the vendor to accept your order',
          ),
          content: Text("")),
      const Step(
          title: CustomStep(
            title: "Order Accepted",
            content:
                "The vendor is Preparing your order and rider will pick up soon",
          ),
          content: Text('')),
      const Step(
          title: CustomStep(
            title: "Order Pickup in progress",
            content:
                "A rider is on the way to the vendor to pick up your order",
          ),
          content: Text('')),
      const Step(
          title: CustomStep(
            title: "Order on the way",
            content:
                "A rider has picked up your order and is bringing it your way",
          ),
          content: Text('')),
      const Step(
          title: CustomStep(
            title: "Order Arrived",
            content: "Dont keep the rider waiting",
          ),
          content: Text('')),
      const Step(
          title: CustomStep(
            title: "Order Delivered",
            content: "Enjoy!",
          ),
          content: Text('')),
    ];
  }

  void subscribeToOrderStatusUpdates() {
    var orderStatusStream = orderStatusChannel!.subscribe();
    orderStatusStream.listen((ably.Message message) {
      var orderStatus = message.data!;
      setState(() {
        switch (orderStatus) {
          case 'ORDER PLACED':
            currentStep = 1;
            break;
          case 'ORDER ACCEPTED':
            currentStep = 2;
            break;
          case 'ORDER PICK UP IN PROGRESS':
            currentStep = 3;
            break;
          case 'ORDER ON THE WAY TO CUSTOMER':
            currentStep = 4;
            break;
          case 'ORDER ARRIVED':
            currentStep = 5;
            break;
          case 'ORDER DELIVERED':
            currentStep = 6;
            break;
          default:
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Tracking',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Stepper(
          connectorColor: MaterialStatePropertyAll(AppColors.appGreen),
          elevation: 5,
          currentStep: currentStep,
          steps: steps,
          controlsBuilder: (context, details) {
            return Container();
          },
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
