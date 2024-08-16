import 'package:flutter/material.dart';
import 'package:vocate/view/screens/bottomnavbar.dart';
import 'package:vocate/view/screens/homescreen.dart';
import 'package:vocate/view/screens/profiledart';

class SavedJobsScreen extends StatefulWidget {
  @override
  _SavedJobsScreenState createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SavedJobsScreen()));
    }
    if (index == 4) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => UserProfileScreen()));
    }
  }

  // Simulated data for jobs
  List<Map<String, String>> notAppliedJobs = [
    {
      'title': '2D Game UI Designer',
      'company': 'Epic Games',
      'location': 'London, UK',
      'employmentType': 'Full-Time',
      'level': 'Senior Level'
    },
    {
      'title': 'Product Designer',
      'company': 'Slack',
      'location': 'Newcastle, UK',
      'employmentType': 'Full-Time',
      'level': 'Entry Level'
    },
  ];

  List<Map<String, String>> appliedJobs = [
    {
      'title': 'Motion Designer',
      'company': 'Epic Games',
      'location': 'London, UK',
      'employmentType': 'Part-Time',
      'level': 'Junior Level'
    },
    {
      'title': 'UI/UX Design Intern',
      'company': 'Uber',
      'location': 'Sheffield, UK',
      'employmentType': 'Internship',
      'level': 'Entry Level'
    },
    {
      'title': 'Packaging Artwork Designer',
      'company': 'PepsiCo',
      'location': 'Oxford, UK',
      'employmentType': 'Full-Time',
      'level': 'Senior Level'
    },
    {
      'title': 'Design Consultant',
      'company': 'Ramboll',
      'location': 'Liverpool, UK',
      'employmentType': 'Part-Time',
      'level': 'Senior Level'
    },
    {
      'title': 'Junior Creative Designer',
      'company': 'SharkNinja',
      'location': 'Birmingham, UK',
      'employmentType': 'Full-Time',
      'level': 'Junior Level'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text('Not Applied',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...notAppliedJobs.map((job) => JobTile(job)).toList(),
            SizedBox(height: 20),
            Text('Applied',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...appliedJobs.map((job) => JobTile(job)).toList(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  final Map<String, String> job;

  JobTile(this.job);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.work, color: Colors.blue),
        title: Text(job['title']!),
        subtitle: Text('${job['company']} • ${job['location']}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(job['employmentType']!, style: TextStyle(color: Colors.grey)),
            Text(job['level']!, style: TextStyle(color: Colors.grey)),
          ],
        ),
        onTap: () {
          // Handle job detail navigation here
        },
      ),
    );
  }
}
