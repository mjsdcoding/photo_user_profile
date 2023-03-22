import 'package:flutter/material.dart';

import 'utils.dart';

void main() {
  runApp(const MainApp());
}

// Please like and subscribe
// thank you!!!!

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ProfilePage(),
    );
  }
}



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isGallerySelected = true;
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          top: 225,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'Sarah Mrylin',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Photographer',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black12),
              ),
              SizedBox(
                height: 80,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    statColumn('68', 'Shots'),
                    statColumn('1.2K', 'Followers'),
                    statColumn('90', 'Following'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 110.0, vertical: 16),
                    child: Text(
                      'Follow',
                      style: TextStyle(fontSize: 14),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isGallerySelected = !_isGallerySelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 12,
                              color: _isGallerySelected
                                  ? Colors.deepPurple
                                  : Colors.deepPurple.shade100,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CircleAvatar(
                            backgroundColor: _isGallerySelected
                                ? Colors.deepPurple
                                : Colors.transparent,
                            radius: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isGallerySelected = !_isGallerySelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            'Collection',
                            style: TextStyle(
                              fontSize: 12,
                              color: _isGallerySelected
                                  ? Colors.deepPurple.shade100
                                  : Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CircleAvatar(
                            backgroundColor: _isGallerySelected
                                ? Colors.transparent
                                : Colors.deepPurple,
                            radius: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: OvalBottomClipper(),
            child: Image.asset('assets/images/girl_back.jpg'),
          ),
        ),
        Positioned(
          top: 465,
          right: 25,
          left: 25,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 5),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(9, (index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img$index.jpg')
                              .image)),
                );
              }),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.white,
                  )),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        radius: 4,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 56,
            backgroundColor: const Color(0xFFEAE1F8),
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  Image.asset('assets/images/girl_portrait.jpg').image,
            ),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
              ),
              label: "Pictures"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Person"),
        ],
      ),
    );
  }

  Column statColumn(String total, String statName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          total,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          statName,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0x2c000000)),
        ),
      ],
    );
  }
}
