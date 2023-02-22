import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnDamageButtonPressed = Function(DamagedParts part);

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
                              state.damagedParts[DamagedParts.frontLeftFender],
                          onTap: () {
                            onPressed(DamagedParts.frontLeftFender);
                          }),
                    ),
                    Positioned(
                      left: 115,
                      bottom: 37,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.leftFrontDoor],
                          onTap: () {
                            onPressed(DamagedParts.leftFrontDoor);
                          }),
                    ),
                    Positioned(
                      right: 92,
                      bottom: 37,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.leftRearDoor],
                          onTap: () {
                            onPressed(DamagedParts.leftRearDoor);
                          }),
                    ),
                    Positioned(
                      right: 37,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.rearLeftFender],
                          onTap: () {
                            onPressed(DamagedParts.rearLeftFender);
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
                          damageType: state.damagedParts[DamagedParts.roof],
                          onTap: () {
                            onPressed(DamagedParts.roof);
                          }),
                    ),
                    Positioned(
                      top: 30,
                      child: DamageButton(
                          damageType: state.damagedParts[DamagedParts.hood],
                          onTap: () {
                            onPressed(DamagedParts.hood);
                          }),
                    ),
                    Positioned(
                      bottom: 16,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.frontBumper],
                          onTap: () {
                            onPressed(DamagedParts.frontBumper);
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
                          damageType: state.damagedParts[DamagedParts.trunk],
                          onTap: () {
                            onPressed(DamagedParts.trunk);
                          }),
                    ),
                    Positioned(
                      bottom: 16,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.rearBumper],
                          onTap: () {
                            onPressed(DamagedParts.rearBumper);
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
                              state.damagedParts[DamagedParts.rearRightFender],
                          onTap: () {
                            onPressed(DamagedParts.rearRightFender);
                          }),
                    ),
                    Positioned(
                      left: 95,
                      bottom: 39,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.rightRearDoor],
                          onTap: () {
                            onPressed(DamagedParts.rightRearDoor);
                          }),
                    ),
                    Positioned(
                      right: 116,
                      bottom: 39,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.rightFrontDoor],
                          onTap: () {
                            onPressed(DamagedParts.rightFrontDoor);
                          }),
                    ),
                    Positioned(
                      right: 52,
                      top: 27,
                      child: DamageButton(
                          damageType:
                              state.damagedParts[DamagedParts.frontRightFender],
                          onTap: () {
                            onPressed(DamagedParts.frontRightFender);
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
