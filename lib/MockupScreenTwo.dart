import 'package:flutter/material.dart';

class MockupScreenTwo extends StatefulWidget {
  const MockupScreenTwo({super.key});

  @override
  State<MockupScreenTwo> createState() => _MockupScreenTwoState();
}

class _MockupScreenTwoState extends State<MockupScreenTwo> {
  final List<Map<String, String>> popularMovies = [
    {
      "title": "Birds Of Prey",
      "image": "assets/images/To all my boys movie image.jpg",
    },
    {
      "title": "Red Sparrow",
      "image": "assets/images/Baby driver image.jpg",
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
      "title": "Boy's palying",
      "image": "assets/images/To all my boys movie image.jpg",
    },
    {
      "title": "Amanda",
      "image": "assets/images/Baby driver image.jpg",
    },
    {
      "title": "Conjuring",
      "image": "assets/images/Johnwick.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Jumanji movie.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 16,
                    child: Text(
                      'TMDB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

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
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final movie = popularMovies[index];
                  double itemWidth = MediaQuery.of(context).size.width / 3.5;
                  if (index == popularMovies.length - 1) {
                     itemWidth = MediaQuery.of(context).size.width / 3.5;
                  }

                  return Container(
                    width: itemWidth,
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              movie["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
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

            const SizedBox(height: 24),

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
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowPlayingMovies.length,
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final movie = nowPlayingMovies[index];
                   double itemWidth = MediaQuery.of(context).size.width / 3.5;

                  return Container(
                     width: itemWidth,
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              movie["image"]!,
                              fit: BoxFit.cover,
                               width: double.infinity,
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
