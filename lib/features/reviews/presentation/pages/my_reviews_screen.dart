import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/floating_action_button.dart';
import 'package:auto/features/reviews/presentation/widgets/my_reviews_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyReviewsScreen extends StatefulWidget {
  const MyReviewsScreen({super.key});

  @override
  State<MyReviewsScreen> createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          floatingActionButton: floatingActionButton(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(AppIcons.appbar_back),
            ),
            elevation: 24,
            shadowColor: const Color.fromRGBO(23, 23, 37, 0.08),
            title: const Text(
              'Мои отзывы',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              MyReviewsContainer(
                statusColor: Color(0xff4D88C8),
                statusIconPath: AppIcons.draftIcon,
                statusTitle: 'Черновик',
              ),
              MyReviewsContainer(
                statusColor: Color(0xffC89E4D),
                statusIconPath: AppIcons.clock,
                statusTitle: 'На модерации',
              ),
              MyReviewsContainer(
                  statusColor: Color(0xffC8534D),
                  statusIconPath: AppIcons.lock,
                  statusTitle: 'Заблокирован',
                  isBlocked: true),
            ],
          ),
        ),
      );
}
