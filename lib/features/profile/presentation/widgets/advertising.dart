import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class Advertising extends StatelessWidget {
  Advertising({Key? key}) : super(key: key);

  final List images = [
    'https://images.unsplash.com/photo-1658884881142-daaeb50bff7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 213,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 16,top: 12),
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) => CachedImage(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            // : BorderRadius.zero,
            imageUrl: images[index],
          ),
        ),
      );
}
