import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';
import 'package:playground_bloc/shared/functions/date_formatter.dart';
import 'package:playground_bloc/shared/functions/text_formatter.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';

class ThirdData extends StatelessWidget {
  const ThirdData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            BlocBuilder<ReimbursmentBloc, ReimbursmentState>(
              buildWhen:
                  (previous, current) =>
                      previous.bossesStatus != current.bossesStatus ||
                      previous.bosses != current.bosses ||
                      previous.bossesErrorMessage != current.bossesErrorMessage,
              builder: (context, state) {
                if (state.bossesStatus == ReimbursmentLoadStatus.loading) {
                  return const SizedBox(
                    height: 40,
                    child: Center(
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }

                if (state.bossesStatus == ReimbursmentLoadStatus.failure) {
                  final message =
                      state.bossesErrorMessage ?? 'Gagal memuat approval line';
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
                              const ReimbursmentLoadBossesRequested(),
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

                if (state.bossesStatus == ReimbursmentLoadStatus.success &&
                    state.bosses.isEmpty) {
                  return Text(
                    'Belum ada approval line',
                    style: TextStyle(color: ColorStyle.grey7, fontSize: 12),
                  );
                }

                if (state.bossesStatus == ReimbursmentLoadStatus.success) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final boss = state.bosses[index];
                      final hasAvatar =
                          (boss.avatarUrl ?? '').trim().isNotEmpty;

                      final status = (boss.status ?? '').trim().toLowerCase();
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
                        'accepted' => DateFormatter().formatDate(boss.date),
                        'rejected' => DateFormatter().formatDate(boss.date),
                        'waiting' => TextFormatter().capitalizeFirstWord(
                          status,
                        ),
                        _ => TextFormatter().capitalizeFirstWord(status),
                      };
                      final showStatus = statusText.isNotEmpty;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorStyle.greyRadioButton,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Icon(statusIcon, size: 16, color: statusColor),
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
    );
  }
}
