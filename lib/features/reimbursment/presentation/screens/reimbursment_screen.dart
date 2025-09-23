import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playground_bloc/constant/icon_constant.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_event.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_state.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_event.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_state.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';
import 'package:playground_bloc/shared/widget/app_bar.dart';
import 'package:playground_bloc/shared/widget/button_custom.dart';

class ReimbursmentScreen extends StatefulWidget {
  const ReimbursmentScreen({super.key});

  @override
  State<ReimbursmentScreen> createState() => _ReimbursmentScreenState();
}

class _ReimbursmentScreenState extends State<ReimbursmentScreen> {
  String? _selectedTypeId;

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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ButtonCustom(
            gradientColor: [ColorStyle.primary, ColorStyle.secondary],
            isGradient: true,
            size: Size(MediaQuery.of(context).devicePixelRatio, 41),
            onPressed: () {},
            name: "Submit Request",
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: ColorStyle.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(color: ColorStyle.greyRadioButton),
                        ),
                        height: 40,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 16),
                            SizedBox(width: 12),
                            Text(
                              "Pilih Tanggal",
                              style: TextStyle(color: ColorStyle.grey7),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Text("Jenis Klaim"),
                      SizedBox(height: 6),
                      BlocBuilder<TypesBloc, TypesState>(
                        builder: (context, state) {
                          Widget child;

                          if (state is TypesLoading) {
                            child = const Center(
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          } else if (state is TypesLoaded) {
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

                            final selectedValue =
                                items.any(
                                      (item) => item.value == _selectedTypeId,
                                    )
                                    ? _selectedTypeId
                                    : null;

                            child = DropdownButton<String>(
                              value: selectedValue,
                              hint: Text(
                                'Pilih tipe klaim',
                                style: TextStyle(color: ColorStyle.grey7),
                              ),
                              items: items,
                              onChanged: (value) {
                                setState(() {
                                  _selectedTypeId = value;
                                });
                              },
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorStyle.black,
                                fontSize: 14,
                              ),
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              underline: const SizedBox(),
                              iconSize: 14,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              isExpanded: true,
                            );
                          } else if (state is TypesError) {
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
                                    state.message,
                                    style: TextStyle(
                                      color: ColorStyle.danger,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      () => context.read<TypesBloc>().add(
                                        LoadTypes(),
                                      ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: ColorStyle.primary,
                                    size: 18,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            child = DropdownButton<String>(
                              value: null,
                              hint: Text(
                                'Pilih tipe klaim',
                                style: TextStyle(color: ColorStyle.grey7),
                              ),
                              items: const [],
                              onChanged: null,
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              underline: const SizedBox(),
                              iconSize: 14,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              isExpanded: true,
                            );
                          }
                          return _dropdownContainer(child);
                        },
                      ),
                      SizedBox(height: 6),
                      Text("Detail"),
                      SizedBox(height: 6),
                      TextFormField(
                        controller: TextEditingController(text: ""),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorStyle.black,
                          fontSize: 12,
                        ),
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
                      Text("Lampiran Bukti"),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: _showUploadBottomSheet,
                        child: DottedBorder(
                          color: ColorStyle.greyRadioButton,
                          strokeWidth: 2,
                          dashPattern: const [6, 3],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 28,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  IconConstant.download,
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Klik untuk upload file dan isi nominal",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "PNG, JPG hingga 5MB",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      Text("Approval Line"),
                      SizedBox(height: 8),
                      BlocBuilder<BossesBloc, BossesState>(
                        builder: (context, state) {
                          if (state is BossesLoading) {
                            return const SizedBox(
                              height: 40,
                              child: Center(
                                child: SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          }

                          if (state is BossesError) {
                            return Row(
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: ColorStyle.danger,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    state.message,
                                    style: TextStyle(
                                      color: ColorStyle.danger,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      () => context.read<BossesBloc>().add(
                                        LoadBosses(),
                                      ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: ColorStyle.primary,
                                    size: 18,
                                  ),
                                ),
                              ],
                            );
                          }

                          if (state is BossesLoaded) {
                            if (state.bosses.isEmpty) {
                              return Text(
                                'Belum ada approval line',
                                style: TextStyle(
                                  color: ColorStyle.grey7,
                                  fontSize: 12,
                                ),
                              );
                            }

                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final boss = state.bosses[index];
                                final hasAvatar =
                                    (boss.avatarUrl ?? '').trim().isNotEmpty;

                                final status =
                                    (boss.status ?? '').trim().toLowerCase();
                                final statusColor = switch (status) {
                                  'accepted' => ColorStyle.success,
                                  'rejected' => ColorStyle.danger,
                                  'waiting' => ColorStyle.grey7,
                                  _ => ColorStyle.grey7,
                                };
                                final statusIcon = switch (status) {
                                  'accepted' => Icons.check_circle_outline,
                                  'rejected' => Icons.cancel_outlined,
                                  'waiting' => Icons.access_time,
                                  _ => Icons.info_outline,
                                };
                                final statusText = switch (status) {
                                  'accepted' => _formatDate(boss.date),
                                  'rejected' => _formatDate(boss.date),
                                  'waiting' => _capitalizeFirstWord(status),
                                  _ => _capitalizeFirstWord(status),
                                };
                                final showStatus = statusText.isNotEmpty;

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          ColorStyle.greyRadioButton,
                                      backgroundImage:
                                          hasAvatar
                                              ? NetworkImage(boss.avatarUrl!)
                                              : null,
                                      child:
                                          hasAvatar
                                              ? null
                                              : Icon(
                                                Icons.person,
                                                color: ColorStyle.white,
                                              ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            boss.name ?? '-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: ColorStyle.black,
                                            ),
                                          ),
                                          if ((boss.role ?? '').isNotEmpty) ...[
                                            const SizedBox(height: 4),
                                            Text(
                                              boss.role!,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: ColorStyle.grey7,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    if (showStatus) ...[
                                      const SizedBox(width: 12),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            statusIcon,
                                            size: 16,
                                            color: statusColor,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            statusText,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: statusColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (context, index) => const Divider(height: 24),
                              itemCount: state.bosses.length,
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdownContainer(Widget child) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: ColorStyle.greyRadioButton, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }

  void _showSubmitDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorStyle.primary, ColorStyle.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Konfirmasi Pengajuan',
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: ColorStyle.white),
                      splashRadius: 18,
                      onPressed: () => Navigator.of(dialogContext).pop(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Pastikan data pengajuan sudah benar sebelum dikirim.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: ColorStyle.greyRadioButton),
                        ),
                        child: const Text('Batal'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorStyle.primary,
                        ),
                        child: const Text('Kirim'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUploadBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45,
          maxChildSize: 0.85,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 18,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorStyle.primary, ColorStyle.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Bukti dan Nominal',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: ColorStyle.white,
                          ),
                          splashRadius: 18,
                          onPressed: () => Navigator.of(sheetContext).pop(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nominal"),
                          SizedBox(height: 6),
                          TextFormField(
                            controller: TextEditingController(text: ""),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.black,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hint: Text("Masukkan nominal disini"),
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
                          SizedBox(height: 6),
                          Text("Keterangan"),
                          SizedBox(height: 6),
                          TextFormField(
                            controller: TextEditingController(text: ""),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.black,
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            decoration: InputDecoration(
                              hint: Text("Masukkan keterangan pengajuan"),
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
              ),
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }

    final localDate = date.toLocal();
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final day = localDate.day.toString().padLeft(2, '0');
    final month = months[localDate.month - 1];
    final year = localDate.year.toString();

    return '$day $month $year';
  }

  String _capitalizeFirstWord(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    final words = trimmed.split(' ');
    final firstWord = words.first;
    if (firstWord.isNotEmpty) {
      words[0] = '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';
    }

    return words.join(' ');
  }
}
