import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/content_item.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late ReelsBloc bloc;

  @override
  void initState() {
    bloc = ReelsBloc()..add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: BlocProvider(
            create: (context) => ReelsBloc(),
            child: BlocBuilder<ReelsBloc, ReelsState>(
              builder: (context, state) => Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      Swiper(
                        itemCount: state.reels.length,
                        allowImplicitScrolling: true,
                        itemHeight: MediaQuery.of(context).size.height,
                        scrollDirection: Axis.vertical,
                        onIndexChanged: (index) {},
                        itemBuilder: (context, index) =>
                            ContentItem(reel: state.reels[index]),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        left: 16,
                        child: Row(
                          children: [
                            WScaleAnimation(
                              child:
                                  SvgPicture.asset(AppIcons.chevronLeftWhite),
                              onTap: () => Navigator.pop(context),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppIcons.whiteLogo),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ),
      );
}
