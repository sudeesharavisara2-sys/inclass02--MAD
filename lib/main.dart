import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _points = 0;

  static const Color darkBlue = Color(0xFF0D47A1);

  void _incrementPoints() {
    setState(() {
      _points++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: darkBlue,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= PROFILE PHOTO =================
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',

                          // Fill circle properly
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,

                          // Move photo slightly upward
                          alignment: const Alignment(0, -0.75),
                        ),
                      ),
                    ),

                    // Verified Icon
                    Positioned(
                      right: 3,
                      bottom: 3,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Divider(
                thickness: 1,
                color: Colors.black26,
              ),

              const SizedBox(height: 24),

              // ================= NAME =================
              const Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Sudeesha',
                style: TextStyle(
                  fontSize: 16,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 20),

              // ================= EMAIL =================
              const Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 6),

              const Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 18,
                    color: darkBlue,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'sudeesharavisara@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: darkBlue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ================= POINTS =================
              const Text(
                'Points',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: darkBlue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$_points',
                    style: const TextStyle(
                      fontSize: 16,
                      color: darkBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // ================= ADD BUTTON =================
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkBlue,
        onPressed: _incrementPoints,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}