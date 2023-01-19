import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/widgets/more_container.dart';
import 'package:flutter/material.dart';

class SingleImagePart extends StatefulWidget {
  final int count;
  final List images;

  const SingleImagePart({
    required this.count,
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  State<SingleImagePart> createState() => _SingleImagePartState();
}

class _SingleImagePartState extends State<SingleImagePart> {
  int currentIndex = 0;
  final ScrollController controller = ScrollController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          SizedBox(
            child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) => setState(() {
                      currentIndex = value;
                    }),
                itemCount: widget.images.isEmpty ? 1 : widget.images.length,
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
                      child: widget.images.isEmpty
                          ? Image.asset(
                              AppImages.defaultPhoto,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              widget.images[index],
                              width: double.maxFinite,
                              height: 340,
                              fit: BoxFit.cover,
                            ),
                    )),
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: 12,
              left: 14,
              right: 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: List.generate(
                        widget.images.length,
                        (index) => MoreContainer(
                          itemQuantity: widget.images.length,
                          color: index == currentIndex
                              ? Colors.white
                              : const Color(0xFFB5B5BE),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}
