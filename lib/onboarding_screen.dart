import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onbording';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onbording1.png",
      "title": "Organize Your Event Easily",
      "subtitle":
          "Choose the type of event, date, and location, and add all the important details",
      "header": "assets/images/headerOnborading.png",
    },
    {
      "image": "assets/images/onboreding2.png",
      "title": "Invite Guests from Your Contacts or Manually",
      "subtitle":
          "Share the invitation via link or WhatsApp, and track RSVPs with a single tap",
      "header": "assets/images/headerLeftOnborading.png",
    },
    {
      "image": "assets/images/onbored2.png",
      "title": "Be Ready Right on Time",
      "subtitle":
          "We’ll send you reminders before the event and alert you if anything’s missing or guests haven’t responded yet.",
      "header": "assets/images/headerOnborading.png",
    },
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
  }

  void _nextPage() async {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      await _completeOnboarding();
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _skipOnboarding() async {
    await _completeOnboarding();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ الهيدر يبدأ من فوق
                  Align(
                    alignment:
                        index == 1 ? Alignment.topRight : Alignment.topLeft,
                    child: Image.asset(
                      data["header"]!,
                      height: 270,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ الصورة
                  Image.asset(data["image"]!, height: 230),

                  const SizedBox(height: 30),

                  // ✅ العنوان
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      data["title"]!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ✅ النص الفرعي
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      data["subtitle"]!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const Spacer(),

                  // ✅ النقاط
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _currentPage == dotIndex ? 10 : 6,
                        height: _currentPage == dotIndex ? 10 : 6,
                        decoration: BoxDecoration(
                          color: _currentPage == dotIndex
                              ? theme.colorScheme.primary
                              : Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // ✅ الأزرار السفلية
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: _currentPage == onboardingData.length - 1
                        ? Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _skipOnboarding,
                                  child: const Text("Log In"),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: OutlinedButton(
                                  onPressed: _skipOnboarding,
                                  child: const Text("Sign Up"),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _nextPage,
                                  child: const Text("Next"),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: OutlinedButton(
                                  onPressed: _skipOnboarding,
                                  child: const Text("Skip"),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 40),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
