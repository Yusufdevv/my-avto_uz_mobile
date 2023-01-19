import 'package:auto/assets/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          body: Center(
            child: PhotoViewGallery.builder(
              // controller: pageController,
              backgroundDecoration: const BoxDecoration(
                color: black,
              ),
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
        ),
      );
}
// CachedNetworkImage(
// imageUrl: widget.images[index],
// errorWidget: (context, url, error) => Image.asset(
// AppIcons.defalut,
// ),
// width: double.maxFinite,
// height: 340,
// fit: BoxFit.cover,
// ),

// SvgPicture.asset(AppIcons.defalut)
