import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import '../controllers/order_tracking_controller.dart';

class OrderTrackingView extends GetView<OrderTrackingController> {
  const OrderTrackingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
        centerTitle: true,
        titleTextStyle: Get.textTheme.titleSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTimelineItem(
              step: 1,
              title: 'Order Placed',
              description:
                  'our order has been successfully placed!\nWe\'re getting everything ready.',
              date: '12 Sep 2024',
              isCompleted: true,
              isFirst: true,
            ),
            _buildTimelineItem(
              step: 2,
              title: 'On The Way',
              description:
                  'our order has been successfully placed!\nWe\'re getting everything ready.',
              date: '12 Sep 2024',
              isCompleted: false,
            ),
            _buildTimelineItem(
              step: 3,
              title: 'Delivered',
              description:
                  'our order has been successfully placed!\nWe\'re getting everything ready.',
              date: '12 Sep 2024',
              isCompleted: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required int step,
    required String title,
    required String description,
    required String date,
    required bool isCompleted,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? AppColor.primary : Colors.white,
                  border: Border.all(
                    color: isCompleted ? AppColor.primary : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    step.toString(),
                    style: Get.textTheme.headlineMedium!.copyWith(
                      color: isCompleted ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted ? AppColor.primary : Colors.grey.shade300,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Get.textTheme.headlineMedium!.copyWith(
                    color: isCompleted ? AppColor.primary : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Get.textTheme.headlineSmall!.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: Colors.grey, fontSize: 10),
                ),
                if (!isLast) const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
