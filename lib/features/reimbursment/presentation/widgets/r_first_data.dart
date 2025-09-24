import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';
import 'package:playground_bloc/shared/functions/date_formatter.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';

class FirstData extends StatelessWidget {
  const FirstData({super.key, required this.detailC});

  final TextEditingController detailC;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: ColorStyle.greyRadioButton),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Detail Pengajuan"),
                SizedBox(height: 12),
                Text("Tanggal"),
                SizedBox(height: 2),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final bloc = context.read<ReimbursmentBloc>();
                    final now = DateTime.now();
                    final initialDate = bloc.state.selectedDate ?? now;
                    final firstDate = DateTime(now.year - 5);
                    final lastDate = DateTime(now.year + 5);

                    final picked = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: firstDate,
                      lastDate: lastDate,
                    );

                    if (picked != null) {
                      bloc.add(ReimbursmentDateSelected(picked));
                    }
                  },
                  child: BlocBuilder<ReimbursmentBloc, ReimbursmentState>(
                    buildWhen:
                        (previous, current) =>
                            previous.selectedDate != current.selectedDate,
                    builder: (context, state) {
                      final formattedDate = DateFormatter().formatDate(
                        state.selectedDate,
                      );
                      final hasSelection = formattedDate.isNotEmpty;
                      final displayText =
                          hasSelection ? formattedDate : 'Pilih Tanggal';

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(color: ColorStyle.greyRadioButton),
                        ),
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, size: 16),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                displayText,
                                style: TextStyle(
                                  color:
                                      hasSelection
                                          ? ColorStyle.black
                                          : ColorStyle.grey7,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (hasSelection)
                              GestureDetector(
                                onTap:
                                    () => context.read<ReimbursmentBloc>().add(
                                      const ReimbursmentDateCleared(),
                                    ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: ColorStyle.grey7,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 6),
                Text("Jenis Klaim"),
                SizedBox(height: 6),
                BlocBuilder<ReimbursmentBloc, ReimbursmentState>(
                  buildWhen:
                      (previous, current) =>
                          previous.typesStatus != current.typesStatus ||
                          previous.types != current.types ||
                          previous.typesErrorMessage !=
                              current.typesErrorMessage ||
                          previous.selectedClaimId != current.selectedClaimId,
                  builder: (context, state) {
                    Widget child;

                    switch (state.typesStatus) {
                      case ReimbursmentLoadStatus.loading:
                        child = const Center(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                        break;
                      case ReimbursmentLoadStatus.success:
                        final items =
                            state.types
                                .where((type) => type.id != null)
                                .map(
                                  (type) => DropdownMenuItem<String>(
                                    value: type.id!,
                                    child: Text(type.description ?? '-'),
                                  ),
                                )
                                .toList();
                        var data =
                            context
                                .read<ReimbursmentBloc>()
                                .state
                                .selectedClaimId;
                        final selectedValue =
                            items.any((item) => item.value == data)
                                ? data
                                : null;

                        child = DropdownButton<String>(
                          value: selectedValue,
                          hint: Text(
                            'Pilih tipe klaim',
                            style: TextStyle(color: ColorStyle.grey7),
                          ),
                          items: items,
                          onChanged: (value) {
                            if (value == null) return;
                            context.read<ReimbursmentBloc>().add(
                              ReimbursmentClaimSelected(value),
                            );
                          },
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ColorStyle.black,
                            fontSize: 14,
                          ),
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          underline: const SizedBox(),
                          iconSize: 14,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          isExpanded: true,
                        );
                        break;
                      case ReimbursmentLoadStatus.failure:
                        final message =
                            state.typesErrorMessage ??
                            'Gagal memuat jenis klaim';
                        child = Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: ColorStyle.danger,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                message,
                                style: TextStyle(
                                  color: ColorStyle.danger,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => context.read<ReimbursmentBloc>().add(
                                    const ReimbursmentLoadTypesRequested(),
                                  ),
                              child: Icon(
                                Icons.refresh,
                                color: ColorStyle.primary,
                                size: 18,
                              ),
                            ),
                          ],
                        );
                        break;
                      case ReimbursmentLoadStatus.initial:
                        child = DropdownButton<String>(
                          value: null,
                          hint: Text(
                            'Pilih tipe klaim',
                            style: TextStyle(color: ColorStyle.grey7),
                          ),
                          items: const [],
                          onChanged: null,
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          underline: const SizedBox(),
                          iconSize: 14,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          isExpanded: true,
                        );
                        break;
                    }

                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorStyle.greyRadioButton,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: child,
                    );
                  },
                ),
                SizedBox(height: 6),
                Text("Detail"),
                SizedBox(height: 6),
                TextFormField(
                  controller: detailC,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorStyle.black,
                    fontSize: 12,
                  ),
                  onChanged: (value) {
                    context.read<ReimbursmentBloc>().add(
                      ReimbursmentDetailTextChanged(value),
                    );
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                    hint: Text("Masukkan detail pengajuan"),
                    fillColor: ColorStyle.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: ColorStyle.greyRadioButton,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: ColorStyle.greyRadioButton,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: ColorStyle.greyRadioButton,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
