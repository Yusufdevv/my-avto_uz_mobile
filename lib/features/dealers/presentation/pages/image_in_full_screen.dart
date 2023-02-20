import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageInFullScreen extends StatefulWidget {
  const ImageInFullScreen({required this.images, Key? key}) : super(key: key);
  final List<String> images;

  @override
  State<ImageInFullScreen> createState() => _ImageInFullScreenState();
}

class _ImageInFullScreenState extends State<ImageInFullScreen> {
  late PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: dark,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16),
                  child:
                      SvgPicture.asset(AppIcons.chevronLeft, color: solitude),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) => setState(() {
                            page = value;
                          }),
                      itemCount:
                          widget.images.isEmpty ? 1 : widget.images.length,
                      itemBuilder: (context, index) => Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0),
                                ],
                              ),
                            ),
                            child: CachedNetworkImage(
                                imageUrl: widget.images[index],
                                width: double.maxFinite),
                          )),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.45,
                  bottom: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: black.withOpacity(0.2)),
                    child: Text(
                      '${page + 1}/${widget.images.length}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: white),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      );
}
