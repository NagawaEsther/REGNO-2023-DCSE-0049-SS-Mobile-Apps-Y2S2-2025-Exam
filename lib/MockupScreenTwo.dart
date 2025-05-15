import 'package:flutter/material.dart';

class MockupScreenTwo extends StatefulWidget {
  const MockupScreenTwo({super.key});

  @override
  State<MockupScreenTwo> createState() => _MockupScreenTwoState();
}

class _MockupScreenTwoState extends State<MockupScreenTwo> {
  // Placeholder movie data
  final List<Map<String, String>> popularMovies = [
    {
      "title": "Birds Of Prey",
      "image": "assets/images/To all my boys movie image.jpg", // Use your asset paths
    },
    {
      "title": "Red Sparrow",
      "image": "assets/images/Baby driver image.jpg", // Use your asset paths
    },
    {
      "title": "To All the Boys :PS.I still love you",
      "image": "assets/images/To all my boys movie image.jpg", 
    },
    {
      "title": "Ford V Ferrari",
      "image": "assets/images/ford v ferari.jpg", 
    },
  ];

  final List<Map<String, String>> nowPlayingMovies = [
    {
      "title": "Now Playing 1",
      "image": "assets/images/To all my boys movie image.jpg", // Use your asset paths
    },
    {
      "title": "Now Playing 2",
      "image": "assets/images/Baby driver image.jpg", // Use your asset paths
    },
    {
      "title": "Now Playing 3",
      "image": "assets/images/Johnwick.jpg", // Use your asset paths
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Use SingleChildScrollView for the whole body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background Image Header
            Container(
              height: 200, // Adjust height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image.jpg"), // Replace with your background image asset
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack( // Use Stack to place content over the image
                children: [
                  // TMDB text
                  Positioned(
                    top: 40, // Adjust position as needed
                    left: 16, // Adjust position as needed
                    child: Text(
                      'TMDB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Add other header elements like search/filters here if needed
                ],
              ),
            ),

            const SizedBox(height: 16), // Space after header

            // What's Popular Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "What's Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200, // Height for the horizontal movie list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies.length,
                // Add padding to the right to show half of the last item
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final movie = popularMovies[index];
                  // Adjust width to control how much of the last item is shown
                  double itemWidth = MediaQuery.of(context).size.width / 3.5; // Example: show about 3.5 items
                  if (index == popularMovies.length - 1) {
                     itemWidth = MediaQuery.of(context).size.width / 3.5; // Keep the same width for the last item
                  }

                  return Container(
                    width: itemWidth, // Set the width of each movie item
                    margin: const EdgeInsets.only(right: 8.0), // Space between items
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              movie["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity, // Make image fill the container width
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie["title"]!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24), // Space between sections

            // Now Playing Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Now Playing",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200, // Height for the horizontal movie list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowPlayingMovies.length,
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final movie = nowPlayingMovies[index];
                   double itemWidth = MediaQuery.of(context).size.width / 3.5; // Example: show about 3.5 items

                  return Container(
                     width: itemWidth, // Set the width of each movie item
                    margin: const EdgeInsets.only(right: 8.0), // Space between items
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              movie["image"]!,
                              fit: BoxFit.cover,
                               width: double.infinity, // Make image fill the container width
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie["title"]!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                           overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
