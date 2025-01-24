import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/routes/app_pages.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Order'),
          centerTitle: true,
          bottom: TabBar(
            tabs: const [
              Tab(text: 'My Order'),
              Tab(text: 'History'),
            ],
            labelStyle: Get.textTheme.labelLarge,
            unselectedLabelColor: AppColor.grey,
            labelColor: AppColor.black,
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrdersList(isHistory: false),
            _buildOrdersList(isHistory: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList({required bool isHistory}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2, // Replace with actual order count
      itemBuilder: (context, index) => _buildOrderCard(isHistory),
    );
  }

  Widget _buildOrderCard(bool isHistory) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/100/100',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Monitor LG 22"inc 4K 120 Fps',
                            style: Get.textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isHistory
                                ? AppColor.primary.withOpacity(0.1)
                                : Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            isHistory ? 'Completed' : 'On Progress',
                            style: Get.textTheme.labelSmall!.copyWith(
                              color: isHistory ? AppColor.primary : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Color: Brown',
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '2 × ₹199',
                      style: Get.textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(Routes.DETAILS);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: AppColor.grey),
                    ),
                    child: const Text('Details'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ORDER_TRACKING);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(isHistory ? 'Received Order' : 'Order Tracking',
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: AppColor.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
