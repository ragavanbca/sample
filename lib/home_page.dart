import 'package:flutter/material.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(imagePath: 'images/1.jpg'),
  ImageDetails(imagePath: 'images/2.jpg'),
  ImageDetails(imagePath: 'images/3.jpg'),
  ImageDetails(imagePath: 'images/4.jpg'),
  ImageDetails(imagePath: 'images/5.jpg'),
  ImageDetails(imagePath: 'images/6.jpg'),
  ImageDetails(imagePath: 'images/7.jpg'),
  ImageDetails(imagePath: 'images/8.jpg'),
  ImageDetails(imagePath: 'images/9.jpg'),
  ImageDetails(imagePath: 'images/10.jpg'),
  ImageDetails(imagePath: 'images/11.jpg'),
  ImageDetails(imagePath: 'images/12.jpg'),
  ImageDetails(imagePath: 'images/14.jpg'),
  ImageDetails(imagePath: 'images/15.jpg'),
  ImageDetails(imagePath: 'images/16.jpg'),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text(
          "Gallery",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => print("SEARCH"),
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => print("MORE"),
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
          child: selectedIndex == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      imagePath: _images[index].imagePath,
                                      // title: _images[index].title,
                                      // photographer: _images[index].photographer,
                                      // price: _images[index].price,
                                      // details: _images[index].details,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'logo$index',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(_images[index].imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: _images.length,
                        ),
                      ),
                    )
                  ],
                )
              : selectedIndex == 1
                  ? Center(
                      child: Text("Comming soon..."),
                    )
                  : Text("Coming soon...")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Photos"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Videos"),
        ],
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  // final String price;
  // final String photographer;
  // final String title;
  // final String details;
  ImageDetails({
    required this.imagePath,
    // required this.price,
    // required this.photographer,
    // required this.title,
    // required this.details,
  });
}
