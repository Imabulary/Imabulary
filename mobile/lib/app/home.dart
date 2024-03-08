import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/flash_card.dart';
import 'package:mobile/app/layout.dart';
import 'package:mobile/app/profile.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Card/card.dart';
import 'package:mobile/widgets/bottom_navigation.dart';

final dio = Dio();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _flashCards = [];

  void _fetchFlashCards() async {
    try {
      final response = await dio.get(
        '${dotenv.env['API_URL']}/flash-cards',
        queryParameters: {
          "pagination": {"page": 1, "limit": 10}
        },
      );

      setState(() {
        _flashCards = response.data!['result']
            .map(
              (flashCard) => FlashCard.fromJson(flashCard),
            )
            .toList();
      });
    } on DioException catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _fetchFlashCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TypeSetting(
            'Welcome to Imabulary!',
            variant: TextVariants.headlineLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          const TypeSetting('Your latest scans'),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashCardScreen(
                      flashCard: _flashCards[index],
                    ),
                  ),
                );
              },
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              tileColor: colors['muted'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _flashCards[index].image_url,
                  width: 55,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: TypeSetting(_flashCards[index].word),
              subtitle: TypeSetting(
                _flashCards[index].translated_word,
                variant: TextVariants.bodySmall,
              ),
            ),
            itemCount: _flashCards.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 12),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const TypeSetting('View all'),
            ),
          )
        ],
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
