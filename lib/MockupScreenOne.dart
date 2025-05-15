
import 'package:flutter/material.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({super.key});

  @override
  State<MockupScreenOne> createState() => _MockupScreenOneState();
}

class _MockupScreenOneState extends State<MockupScreenOne> {
  int _selectedIndex = 0;

  // Movie data list moved into the state class
  final List<Map<String, String>> nowPlaying = [
    {
      "title": "To All the Boys:P.S.I still Love You",
      "image": "assets/images/To all my boys movie image.jpg",
      "date": "2019.1h 48m",
      "description": "Lara Jean and Peter have just taken their roance from a lo..",
      "genre": "Romance, Comedy",
    },
    {
      "title": "Baby Driver",
      "image": "assets/images/Baby driver image.jpg",
      "date": "2019.1h 53m",
      "description": "After being coerced into working for a crime boss,a yo...",
      "genre": "Car Action,Crime ,Drama",
    },
    {
      "title": "John wick",
      "image": "assets/images/Johnwick.jpg",
      "date": "2019-2h 10m",
      "description": "John Wick is on the run after killing a member of the intern..",
      "genre": "Action,Crime,Thriller",
    },
    {
      "title": "Exit",
      "image": "assets/images/Exit movie.jpg",
      "date": "2019.2h 10m ",
      "description": "An action comedy movie",
      "genre": "Action Comedy",
    },
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Purple header with rounded bottom corners
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Container(
              color: Colors.deepPurple,
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  // Row with TMDB, search, and filters
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen, 
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          textStyle: const TextStyle(fontSize: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("TMDB"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Find your movies...",
                            // Removed filled: true and fillColor to remove white background
                            prefixIcon: const Icon(Icons.search, color: Colors.white70), 
                            hintStyle: const TextStyle(color: Colors.white70), 
                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), 
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder( 
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white), 
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Sort | Filters",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Discover text aligned to the left
                  Text(
                    "Discover and enjoy\nyour favourite movies",
                    textAlign: TextAlign.left, 
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
             
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // Changed color
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Popular"),
                ),
               
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    // shape: RoundedRectangleBorder( // Removed shape in previous turn
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                  ),
                  child: const Text("Upcoming"),
                ),
               
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    // shape: RoundedRectangleBorder( // Removed shape in previous turn
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                  ),
                  child: const Text("Now Playing"),
                ),
              ],
            ),
          ),

          // Movie list
          Expanded( // Keep Expanded to fill the remaining space
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: nowPlaying.length,
                itemBuilder: (context, index) {
                  final movie = nowPlaying[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      // Wrapped image in SizedBox to control height and width for vertical orientation
                      leading: SizedBox(
                        width: 100, // Adjusted width
                        height: 150, // Increased height for vertical orientation
                        child: Image.asset(
                          movie["image"]!,
                          fit: BoxFit.cover, // Use BoxFit.cover to fill the box
                        ),
                      ),
                      title: Text(
                        movie["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Release Date: ${movie["date"]}", style: const TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          Text(
                            movie["description"]!,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Genre: ${movie["genre"]}",
                            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( // Keep the BottomNavigationBar
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Set selected and unselected colors to grey by default
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // Movies item: icon is light green when selected, grey otherwise
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
              color: _selectedIndex == 1 ? Colors.lightGreen : Colors.grey, // Movies icon color logic
            ),
            label: 'Movies',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'BookMark',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
