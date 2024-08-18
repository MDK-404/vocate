import 'package:flutter/material.dart';

class SearchResultsScreen extends StatefulWidget {
  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final List<Map<String, dynamic>> jobResults = [
    {
      'image': 'assets/google_logo.png', // Replace with your image path
      'companyName': 'Pinterest',
      'jobTitle': 'Cloud Solutions Architect',
      'location': 'Cambridge, UK',
      'jobType': 'Full-time',
      'workType': 'Hybrid',
      'experienceLevel': 'Junior Level',
      'salary': '\$10,000/m',
      'daysAgo': '5 days ago',
      'applicants': '30+ applicants',
      'isBookmarked': false,
    },
    {
      'image': 'assets/google_logo.png', // Replace with your image path
      'companyName': 'Airbnb',
      'jobTitle': 'Junior UX Researcher',
      'location': 'Liverpool, UK',
      'jobType': 'Full-time',
      'workType': 'Remote',
      'experienceLevel': 'Junior Level',
      'salary': '\$6,500/m',
      'daysAgo': '2 days ago',
      'applicants': '10+ applicants',
      'isBookmarked': false,
    },
    // Add more job results as needed
  ];

  void toggleBookmark(int index) {
    setState(() {
      jobResults[index]['isBookmarked'] = !jobResults[index]['isBookmarked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // More actions
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Ux ui designer',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Clear the search field
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '100+ Search results',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: jobResults.length,
                itemBuilder: (context, index) {
                  final job = jobResults[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                job['image'],
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job['jobTitle'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      '${job['companyName']} • ${job['location']}',
                                      style: TextStyle(fontSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  job['isBookmarked']
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                ),
                                onPressed: () {
                                  toggleBookmark(index);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Chip(
                                  label: Text(job['jobType']),
                                ),
                              ),
                              Flexible(
                                child: Chip(
                                  label: Text(job['workType']),
                                ),
                              ),
                              Flexible(
                                child: Chip(
                                  label: Text(job['experienceLevel']),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 16.0),
                                  SizedBox(width: 4.0),
                                  Text(job['daysAgo']),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.people, size: 16.0),
                                  SizedBox(width: 4.0),
                                  Text(job['applicants']),
                                ],
                              ),
                              Text(
                                job['salary'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
