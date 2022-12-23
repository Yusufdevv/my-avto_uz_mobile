import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(textWithButton: 'Правила пользования'),
      );
}
