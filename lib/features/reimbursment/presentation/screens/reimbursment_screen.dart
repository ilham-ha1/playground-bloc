import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/widgets/r_bottom_bar.dart';
import 'package:playground_bloc/features/reimbursment/presentation/widgets/r_first_data.dart';
import 'package:playground_bloc/features/reimbursment/presentation/widgets/r_second_data.dart';
import 'package:playground_bloc/features/reimbursment/presentation/widgets/r_third_data.dart';
import 'package:playground_bloc/shared/widget/app_bar.dart';

class ReimbursmentScreen extends StatefulWidget {
  const ReimbursmentScreen({super.key});

  @override
  State<ReimbursmentScreen> createState() => _ReimbursmentScreenState();
}

class _ReimbursmentScreenState extends State<ReimbursmentScreen> {
  TextEditingController detailC = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ReimbursmentBloc>().add(const ReimbursmentLoadAllRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(title: 'Pengajuan Reimburs'),
      bottomNavigationBar: ReimbursmentBottomBar(),
      body: BlocBuilder<ReimbursmentBloc, ReimbursmentState>(
        builder: (context, state) {
          final isLoading =
              state.typesStatus == ReimbursmentLoadStatus.loading &&
              state.types.isEmpty;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                spacing: 12,
                children: [
                  FirstData(detailC: detailC),
                  const SecondData(),
                  const ThirdData(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
