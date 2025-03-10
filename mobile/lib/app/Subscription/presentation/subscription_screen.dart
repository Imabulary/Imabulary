import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  final List<SubscriptionPlan> plans = const [
    SubscriptionPlan(
      name: "Basic Plan",
      price: 4.99,
      icon: Icons.star_border,
      advantages: ["✔ 50 flashcards per day", "✔ Basic learning insights"],
    ),
    SubscriptionPlan(
      name: "Pro Plan",
      price: 9.99,
      icon: Icons.star,
      advantages: [
        "✔ Unlimited flashcards",
        "✔ AI-powered learning insights",
        "✔ Sync across all devices"
      ],
    ),
    SubscriptionPlan(
      name: "Premium Plan",
      price: 14.99,
      icon: Icons.star_purple500_outlined,
      advantages: [
        "✔ All Pro features",
        "✔ Priority support",
        "✔ Exclusive learning resources"
      ],
    ),
  ];

  void _showPlanDetails(BuildContext context, SubscriptionPlan plan) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return _SubscriptionDetailBottomSheet(
          plan: plan,
          onSubscribe: () {
            Navigator.pop(context);
            print("Navigating to payment for ${plan.name}...");
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subscription Plans")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Card(
            child: ListTile(
              leading: Icon(plan.icon, size: 32, color: Colors.yellow),
              title: Text(plan.name, style: const TextStyle(fontSize: 18)),
              subtitle: Text("\$${plan.price} / month"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _showPlanDetails(context, plan),
            ),
          );
        },
      ),
    );
  }
}

class _SubscriptionDetailBottomSheet extends StatelessWidget {
  final SubscriptionPlan plan;
  final VoidCallback onSubscribe;

  const _SubscriptionDetailBottomSheet({
    required this.plan,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Text(
              plan.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: plan.advantages
                  .map((advantage) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(advantage,
                            style: const TextStyle(fontSize: 14)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubscribe,
                child: const Text("Subscribe"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPlan {
  final String name;
  final double price;
  final IconData icon;
  final List<String> advantages;

  const SubscriptionPlan({
    required this.name,
    required this.price,
    required this.icon,
    required this.advantages,
  });
}
