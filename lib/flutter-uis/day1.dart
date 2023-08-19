import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF48D861);
const Color secondaryColor = Color(0xFF2A2A2A);
const Color backgroundColor = Color(0xFFF1F1F1);
const Color focusColor = Colors.white;

class Day1 extends StatefulWidget {
  const Day1({super.key});

  @override
  State<Day1> createState() => _Day1State();
}

class _Day1State extends State<Day1> {
  final List<Widget> _bodyItems = const [
    HomePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyItems.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        showUnselectedLabels: true,
        onTap: (int newIndex) => setState(() {
          index = newIndex;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_max,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _categories = [
    "All",
    "Smartphones",
    "Headphones",
    "Laptops",
    "Gaming Consoles"
  ];
  String? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: backgroundColor,
                    width: 2,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundColor: primaryColor,
                radius: 10,
                child: Text(
                  "3",
                  style: TextStyle(
                    fontSize: 12,
                    color: focusColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefix: SizedBox(
                    width: 15,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            // Banner or We can use something like carousel for this
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://flipkartads.azureedge.net/flipkartads/PLABANNER1.4.png",
                ),
              ),
            ),
            // Products by categories
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(fontSize: 14, color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (buildContext, index) =>
                          _selectedCategory == _categories.elementAt(index)
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor,
                                  ),
                                  child: Text(
                                    _categories.elementAt(index),
                                    style: const TextStyle(
                                      color: focusColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedCategory =
                                          _categories.elementAt(index);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: secondaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      _categories.elementAt(index),
                                      style: const TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                      separatorBuilder: (buildContext, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: _categories.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      "https://static.vecteezy.com/system/resources/thumbnails/008/476/519/small/modern-laptop-3d-illustration-png.png",
                      "https://www.transparentpng.com/thumb/laptop/YmlelI-laptops-png-images-notebook-png-image-laptop.png",
                      "https://static.vecteezy.com/system/resources/thumbnails/008/476/519/small/modern-laptop-3d-illustration-png.png",
                      "https://www.transparentpng.com/thumb/laptop/YmlelI-laptops-png-images-notebook-png-image-laptop.png",
                      "https://static.vecteezy.com/system/resources/thumbnails/008/476/519/small/modern-laptop-3d-illustration-png.png",
                      "https://www.transparentpng.com/thumb/laptop/YmlelI-laptops-png-images-notebook-png-image-laptop.png",
                    ]
                        .map(
                          (e) => Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width / 2.5,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  color: backgroundColor,
                                ),
                                child: Image.network(
                                  e,
                                  height: 80,
                                ),
                              ),
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Laptop",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        "\$132.00",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
