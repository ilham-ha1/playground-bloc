import 'package:flutter/material.dart';

class ReimbursmentScreen extends StatefulWidget {
  const ReimbursmentScreen({super.key});

  @override
  State<ReimbursmentScreen> createState() => _ReimbursmentScreenState();
}

class _ReimbursmentScreenState extends State<ReimbursmentScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<ReimbursmentBloc>().add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Reimbursement Claims')));
  }
}
