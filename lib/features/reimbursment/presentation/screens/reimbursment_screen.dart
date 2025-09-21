import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_event.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_event.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';
import 'package:playground_bloc/shared/widget/app_bar.dart';
import 'package:playground_bloc/shared/widget/button_custom.dart';

class ReimbursmentScreen extends StatefulWidget {
  const ReimbursmentScreen({super.key});

  @override
  State<ReimbursmentScreen> createState() => _ReimbursmentScreenState();
}

class _ReimbursmentScreenState extends State<ReimbursmentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TypesBloc>().add(LoadTypes());
    context.read<BossesBloc>().add(LoadBosses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(title: 'Pengajuan Reimburs'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonCustom(
          isGradient: true,
          onPressed: () {},
          name: "Login",
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ColorStyle.white,
          ),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [
        ],)),
    );
  }
}
