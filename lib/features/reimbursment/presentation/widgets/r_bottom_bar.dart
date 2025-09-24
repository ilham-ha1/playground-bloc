import 'package:flutter/material.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';
import 'package:playground_bloc/shared/widget/button_custom.dart';

class ReimbursmentBottomBar extends StatelessWidget {
  const ReimbursmentBottomBar({super.key});

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
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
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
                              icon: const Icon(
                                Icons.close,
                                color: ColorStyle.white,
                              ),
                              splashRadius: 18,
                              onPressed:
                                  () => Navigator.of(dialogContext).pop(),
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
                                onPressed:
                                    () => Navigator.of(dialogContext).pop(),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: ColorStyle.greyRadioButton,
                                  ),
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
          },
          name: "Submit Request",
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
