import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagesPage extends StatefulWidget {
  final int count;
  final List images;

  const ImagesPage({Key? key, required this.count, required this.images})
      : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  int currentIndex = 0;
  final ScrollController controller = ScrollController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const ClampingScrollPhysics(),
                  backgroundDecoration: const BoxDecoration(
                    color: black,
                  ),
                  onPageChanged: (value) => setState(() {
                    currentIndex = value;
                  }),
                  itemCount: widget.images.length,
                  builder: (context, index) => PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(
                      widget.images[index],
                    ),
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                  ),
                  loadingBuilder: (_, __) => const CupertinoActivityIndicator(),
                  pageController: pageController,
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
