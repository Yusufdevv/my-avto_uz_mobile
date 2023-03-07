import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedPart part);

class DamageCarsItem extends StatelessWidget {
  final OnDamageButtonPressed onPressed;

  const DamageCarsItem({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PostingAdBloc, PostingAdState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.carFromLeft,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 54,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.frontLeftFender],
                          onTap: () {
                            onPressed(DamagedPart.frontLeftFender);
                          }),
                    ),
                    Positioned(
                      left: 115,
                      bottom: 37,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.leftFrontDoor],
                          onTap: () {
                            onPressed(DamagedPart.leftFrontDoor);
                          }),
                    ),
                    Positioned(
                      right: 92,
                      bottom: 37,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.leftRearDoor],
                          onTap: () {
                            onPressed(DamagedPart.leftRearDoor);
                          }),
                    ),
                    Positioned(
                      right: 37,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.rearLeftFender],
                          onTap: () {
                            onPressed(DamagedPart.rearLeftFender);
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.carFromFront,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 3,
                      child: DamageButton(
                          damageType: state.damagedParts[DamagedPart.roof],
                          onTap: () {
                            onPressed(DamagedPart.roof);
                          }),
                    ),
                    Positioned(
                      top: 30,
                      child: DamageButton(
                          damageType: state.damagedParts[DamagedPart.hood],
                          onTap: () {
                            onPressed(DamagedPart.hood);
                          }),
                    ),
                    Positioned(
                      bottom: 16,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.frontBumper],
                          onTap: () {
                            onPressed(DamagedPart.frontBumper);
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.carFromBack,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 24,
                      child: DamageButton(
                          damageType: state.damagedParts[DamagedPart.trunk],
                          onTap: () {
                            onPressed(DamagedPart.trunk);
                          }),
                    ),
                    Positioned(
                      bottom: 16,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.rearBumper],
                          onTap: () {
                            onPressed(DamagedPart.rearBumper);
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AppIcons.carFromRight,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 39,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.rearRightFender],
                          onTap: () {
                            onPressed(DamagedPart.rearRightFender);
                          }),
                    ),
                    Positioned(
                      left: 95,
                      bottom: 39,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.rightRearDoor],
                          onTap: () {
                            onPressed(DamagedPart.rightRearDoor);
                          }),
                    ),
                    Positioned(
                      right: 116,
                      bottom: 39,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.rightFrontDoor],
                          onTap: () {
                            onPressed(DamagedPart.rightFrontDoor);
                          }),
                    ),
                    Positioned(
                      right: 52,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedPart.frontRightFender],
                          onTap: () {
                            onPressed(DamagedPart.frontRightFender);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
