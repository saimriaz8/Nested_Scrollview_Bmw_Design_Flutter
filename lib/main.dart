import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String coverImage =
      'https://images.unsplash.com/photo-1552234816-0ea7b995a55c?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  const Color(0xff3A404A),
        body: Center(
            child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text(
                      'BMW',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'jost',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    pinned: true,
                    backgroundColor: const Color(0xff2C2C2C),
                    centerTitle: true,
                expandedHeight: 600,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    coverImage,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("BMW M5"),
                    const Text(
                      "The BMW M5 is a high-performance luxury sedan that blends power, technology, and comfort to create the ultimate driving experience.",
                      style: TextStyle(fontSize: 16, fontFamily: 'jost'),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle("Key Specifications"),
                    _buildSpecification("Engine", "4.4L Twin-Turbo V8"),
                    _buildSpecification("Horsepower", "617 HP"),
                    _buildSpecification("0-100 km/h", "3.2 seconds"),
                    _buildSpecification("Top Speed", "305 km/h"),
                    _buildSpecification("Transmission", "8-speed automatic"),
                    const SizedBox(height: 20),
                    _buildSectionTitle("Advanced Features"),
                    _buildFeature(
                      "M xDrive All-Wheel Drive",
                      "Ensures optimal traction and control for dynamic handling.",
                    ),
                    _buildFeature(
                      "Adaptive M Suspension",
                      "Electronically controlled dampers for superior ride comfort and agility.",
                    ),
                    _buildFeature(
                      "M Carbon Ceramic Brakes",
                      "High-performance braking system for precision stopping power.",
                    ),
                    _buildFeature(
                      "M Mode Selector",
                      "Customizable drive modes for a personalized driving experience.",
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle("Latest BMW Models"),
                    _buildCarModelTile("BMW i4", "Electric Gran Coupe"),
                    _buildCarModelTile("BMW X5 M", "High-performance SUV"),
                    _buildCarModelTile("BMW M8 Competition", "Luxury sports coupe"),
                    const SizedBox(height: 20),
                    _buildSectionTitle("Customer Reviews"),
                    _buildReview("James Wilson",
                        "A thrilling combination of speed and luxury!"),
                    _buildReview("Emma Johnson",
                        "The M5 delivers power and precision like no other sedan."),
                    _buildReview("Robert White",
                        "Unparalleled driving experience with cutting-edge tech."),
                    const SizedBox(height: 20),
                    _buildSectionTitle("BMW Gallery"),
                    _buildGallery(),
                    const SizedBox(height: 20),
                    _buildSectionTitle("Find a Dealer Near You"),
                    const Text(
                      "Looking to own a BMW M5? Visit your nearest BMW dealer and experience the power firsthand!",
                      style: TextStyle(fontSize: 16, fontFamily: 'jost'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll( Color(0xff2C2C2C)),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)),
                      child: const Text(
                        "Find a Dealer",
                        style: TextStyle(fontFamily: 'jost'),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'jost'),
  );
}

Widget _buildSpecification(String key, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'jost')),
        Text(value, style: const TextStyle(fontSize: 16, fontFamily: 'jost')),
      ],
    ),
  );
}

Widget _buildFeature(String title, String description) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle, color: Colors.green),
      title: Text(title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'jost')),
      subtitle: Text(description, style: const TextStyle(fontFamily: 'jost')),
    ),
  );
}

Widget _buildCarModelTile(String name, String description) {
  return Card(
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      tileColor: const Color(0xff2C2C2C),
      title: Text(name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'jost',
              color: Colors.white)),
      subtitle: Text(
        description,
        style: const TextStyle(fontFamily: 'jost', color: Colors.white),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
    ),
  );
}

Widget _buildReview(String name, String review) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      tileColor: const Color(0xff2C2C2C),
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'jost')),
      subtitle: Text(review,
          style: const TextStyle(fontFamily: 'jost', color: Colors.white)),
    ),
  );
}

Widget _buildGallery() {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildGalleryImage("https://images.unsplash.com/photo-1603189549723-29a00cd56120?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        _buildGalleryImage("https://images.unsplash.com/photo-1616591938203-9b5630a01006?q=80&w=2126&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        _buildGalleryImage("https://images.unsplash.com/photo-1616455165036-bf508ec577f5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        _buildGalleryImage("https://images.unsplash.com/photo-1619362280026-accdce53f512?q=80&w=2091&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ],
    ),
  );
}

Widget _buildGalleryImage(String imagePath) {
  return Container(
    width: 120,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
