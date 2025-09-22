import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class MyCourse1Screen extends StatefulWidget {
  const MyCourse1Screen({super.key});

  @override
  State<MyCourse1Screen> createState() => _MyCourse1ScreenState();
}

class _MyCourse1ScreenState extends State<MyCourse1Screen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define base dimensions from Figma (375x812)
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Helper to scale dimensions
    double scaleWidth(double value) => value * (screenWidth / baseWidth);
    double scaleHeight(double value) => value * (screenHeight / baseHeight);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildStatusBar(screenWidth, scaleWidth, scaleHeight),
            _buildNavigationBar(screenWidth, scaleWidth, scaleHeight),
            SizedBox(height: scaleHeight(12)), // Spacing between nav bar and 'Learned today' card
            _buildLearnedTodayCard(screenWidth, scaleWidth, scaleHeight),
            SizedBox(height: scaleHeight(12)), // Spacing between cards
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: scaleWidth(20)),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                      shrinkWrap: true, // Wrap content
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: scaleWidth(14),
                        mainAxisSpacing: scaleHeight(14),
                        childAspectRatio: scaleWidth(160) / scaleHeight(182.688), // Card dimensions 160x182.688
                      ),
                      itemCount: 3, // Number of course cards shown in the JSON
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return _buildCourseCard(
                            context,
                            title: 'Product\nDesign v1.0',
                            completed: '14/24',
                            cardColor: const Color(0xFFF5E7EB),
                            progressColor: const Color(0xFFEC7B9C),
                            playButtonColor: const Color(0xFFEC7B9C),
                            scaleWidth: scaleWidth,
                            scaleHeight: scaleHeight,
                          );
                        } else if (index == 1) {
                          return _buildCourseCard(
                            context,
                            title: 'Visual Design',
                            completed: '10/16',
                            cardColor: const Color(0xFFBADEC8),
                            progressColor: const Color(0xFF388A80),
                            playButtonColor: const Color(0xFF388A80),
                            scaleWidth: scaleWidth,
                            scaleHeight: scaleHeight,
                          );
                        } else {
                          return _buildCourseCard(
                            context,
                            title: 'Java \nDevelopment',
                            completed: '12/18',
                            cardColor: const Color(0xFFBAD6FF),
                            progressColor: const Color(0xFF3D5CFF),
                            playButtonColor: const Color(0xFF3D5CFF),
                            scaleWidth: scaleWidth,
                            scaleHeight: scaleHeight,
                          );
                        }
                      },
                    ),
                    SizedBox(height: scaleHeight(20)), // Padding at the bottom of the scroll view
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar(double screenWidth, double Function(double) scaleWidth, double Function(double) scaleHeight) {
    return Container(
      width: screenWidth,
      height: scaleHeight(44),
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(21)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: GoogleFonts.poppins(
              color: const Color(0xFF1F1F39),
              fontSize: scaleWidth(15),
              fontWeight: FontWeight.w600, // Figma often uses semibold for time
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.signal_cellular_alt,
                size: scaleWidth(16),
                color: const Color(0xFF1F1F39),
              ),
              SizedBox(width: scaleWidth(5)),
              Icon(
                Icons.wifi,
                size: scaleWidth(16),
                color: const Color(0xFF1F1F39),
              ),
              SizedBox(width: scaleWidth(5)),
              Icon(
                Icons.battery_full,
                size: scaleWidth(18),
                color: const Color(0xFF1F1F39),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(double screenWidth, double Function(double) scaleWidth, double Function(double) scaleHeight) {
    return Container(
      width: screenWidth,
      height: scaleHeight(44),
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(17)),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: scaleWidth(20), color: const Color(0xFF1F1F39)),
            onPressed: () {
              context.pop(); // Using go_router for back navigation
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'My courses',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: scaleWidth(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: scaleWidth(40)), // Placeholder for right side alignment
        ],
      ),
    );
  }

  Widget _buildLearnedTodayCard(double screenWidth, double Function(double) scaleWidth, double Function(double) scaleHeight) {
    return Container(
      width: scaleWidth(335),
      height: scaleHeight(96),
      margin: EdgeInsets.symmetric(horizontal: scaleWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scaleWidth(12)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B8D2).withOpacity(0.2),
            offset: Offset(0, scaleHeight(8)),
            blurRadius: scaleWidth(12),
          ),
        ],
      ),
      padding: EdgeInsets.all(scaleWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learned today',
            style: GoogleFonts.poppins(
              color: const Color(0xFF858597),
              fontSize: scaleWidth(12),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: scaleHeight(4)),
          Row(
            children: [
              Text(
                '46min',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: scaleWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: scaleWidth(4)),
              Text(
                '/ 60min',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF858597),
                  fontSize: scaleWidth(10),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: scaleHeight(8)),
          Stack(
            children: [
              Container(
                width: scaleWidth(303),
                height: scaleHeight(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3FD),
                  borderRadius: BorderRadius.circular(scaleHeight(3)),
                ),
              ),
              Container(
                width: scaleWidth(210), // 210 / 303 ~ 0.69
                height: scaleHeight(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scaleHeight(3)),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(0, 255, 255, 255), // Start with transparent white
                      Color(0xFFFF5106),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context, {
    required String title,
    required String completed,
    required Color cardColor,
    required Color progressColor,
    required Color playButtonColor,
    required double Function(double) scaleWidth,
    required double Function(double) scaleHeight,
  }) {
    return Container(
      width: scaleWidth(160),
      height: scaleHeight(182.688),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(scaleWidth(12)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B8D2).withOpacity(0.2),
            offset: Offset(0, scaleHeight(8)),
            blurRadius: scaleWidth(12),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(scaleWidth(19), scaleHeight(25), scaleWidth(19), scaleHeight(19)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFF1F1F39),
              fontSize: scaleWidth(16),
              fontWeight: FontWeight.w700,
              height: 1.5, // Line height 24px for 16px font
            ),
          ),
          SizedBox(height: scaleHeight(26.455)),
          Stack(
            children: [
              Container(
                width: scaleWidth(122),
                height: scaleHeight(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(scaleHeight(3)),
                ),
              ),
              Container(
                width: scaleWidth(80.859), // Example width from JSON, around 66%
                height: scaleHeight(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scaleHeight(3)),
                  gradient: LinearGradient(
                    colors: [
                      progressColor,
                      progressColor.withOpacity(0.5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: scaleHeight(8.544)),
          Text(
            'Completed',
            style: GoogleFonts.poppins(
              color: const Color(0xFF1F1F39),
              fontSize: scaleWidth(12),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: scaleHeight(1.544)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                completed,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: scaleWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to course details screen using go_router
                  context.push('/courseDetails');
                },
                child: Container(
                  width: scaleWidth(44),
                  height: scaleHeight(44),
                  decoration: BoxDecoration(
                    color: playButtonColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: scaleWidth(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}