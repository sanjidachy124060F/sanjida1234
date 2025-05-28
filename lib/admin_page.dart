import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final List<_AdminAction> actions = [
    _AdminAction('View Reports', Icons.bar_chart, Colors.blue),
    _AdminAction('Approve Members', Icons.verified_user, Colors.green),
    _AdminAction('Send Notice', Icons.notifications_active, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.indigo.shade700,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: actions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final action = actions[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              shadowColor: action.color.withOpacity(0.5),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  // Add your action handlers here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${action.title} tapped')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: action.color.withOpacity(0.15),
                        child: Icon(
                          action.icon,
                          color: action.color,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        action.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: Colors.indigo.shade300),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AdminAction {
  final String title;
  final IconData icon;
  final Color color;

  _AdminAction(this.title, this.icon, this.color);
}
