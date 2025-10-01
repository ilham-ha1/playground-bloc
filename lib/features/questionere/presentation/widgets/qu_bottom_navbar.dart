import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_event.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';
import 'package:playground_bloc/shared/widget/button_custom.dart';

class QuBottomNavigationBar extends StatelessWidget {
  const QuBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ButtonCustom(
          gradientColor: [ColorStyle.primary, ColorStyle.secondary],
          isGradient: true,
          size: Size(MediaQuery.of(context).devicePixelRatio, 41),
          onPressed: () {
            final qBloc = context.read<QuestionereBloc>();
            log("message ${context.read<QuestionereBloc>().hashCode}");
            qBloc.add(const QuestionereEvent.init());
            context.go(RouteConstants.photo, extra: qBloc);
          },
          name: "Mulai Ambil Foto",
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ColorStyle.white,
          ),
        ),
      ),
    );
  }
}
