import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> ongoingProjects = [
    'City Center Clean-Up Drive',
    'Blood Donation Campaign',
    'Tree Plantation Week',
  ];

  final List<String> ourWorks = [
    'Organized Youth Seminars',
    'Community Health Camps',
    'Educational Tutoring',
  ];

  final List<String> futurePlans = [
    'Youth Career Fair – July 2025',
    'Skill Development Bootcamp',
    'Community Health Awareness',
  ];

  final List<Map<String, String>> members = [
    {'name': 'Rahim Uddin', 'designation': 'President'},
    {'name': 'Fatima Akter', 'designation': 'Vice President'},
    {'name': 'Hasan Chowdhury', 'designation': 'Secretary'},
    {'name': 'Nusrat Jahan', 'designation': 'Treasurer'},
    {'name': 'Abdullah Khan', 'designation': 'Member'},
    {'name': 'Samira Hossain', 'designation': 'Member'},
    {'name': 'Imran Hossain', 'designation': 'Member'},
    {'name': 'Sabrina Yasmin', 'designation': 'Member'},
    {'name': 'Kamrul Islam', 'designation': 'Member'},
    {'name': 'Mumtaz Begum', 'designation': 'Member'},
  ];

  final double totalFunds = 48000.50;
  final String bkashNumber = '01886934530';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Sylhet Youth Forum'),
        backgroundColor: Colors.indigo.shade700,
        centerTitle: true,
        leading: const Icon(Icons.group),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Ongoing Projects
            _buildSectionTitle(context, 'Ongoing Projects'),
            ...ongoingProjects.map((project) => _buildListCard(
                icon: Icons.check_circle,
                iconColor: Colors.green,
                text: project,
                backgroundColor: Colors.green.shade50)),

            const SizedBox(height: 24),

            // Our Works
            _buildSectionTitle(context, 'Our Works'),
            ...ourWorks.map((work) => _buildListCard(
                icon: Icons.work,
                iconColor: Colors.blue,
                text: work,
                backgroundColor: Colors.blue.shade50)),

            const SizedBox(height: 24),

            // Upcoming Plans
            _buildSectionTitle(context, 'Upcoming Plans'),
            ...futurePlans.map((plan) => _buildListCard(
                icon: Icons.event_note,
                iconColor: Colors.orange,
                text: plan,
                backgroundColor: Colors.orange.shade50)),

            const SizedBox(height: 24),

            // Our Members (Wrap instead of GridView)
            _buildSectionTitle(context, 'Our Members'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16, // horizontal spacing between items
              runSpacing: 16, // vertical spacing between lines
              children: members.map((member) {
                final name = member['name']!;
                final designation = member['designation']!;
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) / 3, // 3 columns with padding considered
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.indigo.shade200,
                            child: Text(
                              name[0],
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            designation,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade700,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Fund Collection
            _buildSectionTitle(context, 'Fund Collection'),
            Card(
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.volunteer_activism,
                        color: Colors.blue, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Total Collected: ৳${totalFunds.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Donate Now
            _buildSectionTitle(context, 'Donate Now'),
            Card(
              color: Colors.pink.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    const Icon(Icons.mobile_friendly,
                        color: Colors.pink, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Send your donations via bkash: $bkashNumber',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade800,
        ),
      ),
    );
  }

  Widget _buildListCard({
    required IconData icon,
    required Color iconColor,
    required String text,
    required Color backgroundColor,
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(text),
      ),
    );
  }
}
