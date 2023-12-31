import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagesPage extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImagesPage({
    required this.initialIndex,
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  int currentIndex = 0;
  final ScrollController controller = ScrollController();
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialIndex);
    currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: PageView.builder(
                  onPageChanged: (value) => setState(() {
                    currentIndex = value;
                  }),
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) => CachedNetworkImage(
                      imageUrl: widget.images[index],
                      fit: BoxFit.cover,
                    ),
                  controller: pageController,
                ),
              ),
              Positioned(
                top: 40,
                left: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12, right: 12, top: 4, left: 8),
                    child: SvgPicture.asset(
                      AppIcons.chevronLeft,
                      color: white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${currentIndex + 1} / ${widget.images.length}',
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
