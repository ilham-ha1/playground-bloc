import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playground_bloc/constant/icon_constant.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';
import 'package:playground_bloc/shared/styles/color_style.dart';
import 'package:playground_bloc/shared/widget/button_custom.dart';

class SecondData extends StatelessWidget {
  const SecondData({super.key});

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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Lampiran Bukti'),
            const SizedBox(height: 16),
            BlocBuilder<ReimbursmentBloc, ReimbursmentState>(
              buildWhen:
                  (previous, current) =>
                      previous.evidences != current.evidences,
              builder: (context, state) {
                final evidences = state.evidences;

                if (evidences.isEmpty) {
                  return _AddEvidenceCallToAction(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: evidences.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder:
                          (context, index) => _EvidenceTile(
                            evidence: evidences[index],
                            index: index,
                            onTap: () {
                              _showBottomSheet(context, editingIndex: index);
                            },
                          ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 40,
                      child: ButtonCustom(
                        onPressed: () {
                          _showBottomSheet(context);
                        },
                        color: ColorStyle.white,
                        name: "Tambah Item",
                        textStyle: TextStyle(color: ColorStyle.grey3),
                        borderRadius: 8,
                        borderColor: ColorStyle.grey3,
                        borderWidth: 1,
                        isOutlined: true,
                        icon: IconConstant.add,
                        iconColor: ColorStyle.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(
    BuildContext context, {
    int? editingIndex,
  }) async {
    final bloc = context.read<ReimbursmentBloc>();

    if (editingIndex != null) {
      bloc.add(ReimbursmentEvidenceEditingStarted(editingIndex));
    } else {
      bloc.add(const ReimbursmentEvidenceFormReset());
    }

    await Future<void>.delayed(Duration.zero);

    if (!context.mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (_) =>
              BlocProvider.value(value: bloc, child: const _AttachmentSheet()),
    );

    bloc.add(const ReimbursmentEvidenceFormReset());
  }
}

class _AttachmentSheet extends StatefulWidget {
  const _AttachmentSheet();

  @override
  State<_AttachmentSheet> createState() => _AttachmentSheetState();
}

class _AttachmentSheetState extends State<_AttachmentSheet> {
  late final TextEditingController _nominalController;
  late final TextEditingController _informationController;

  @override
  void initState() {
    super.initState();
    final state = context.read<ReimbursmentBloc>().state;
    _nominalController = TextEditingController(text: state.nominalText ?? '');
    _informationController = TextEditingController(
      text: state.informationText ?? '',
    );
  }

  @override
  void dispose() {
    _nominalController.dispose();
    _informationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 18,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Material(
              color: Colors.white,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: mediaQuery.size.height * 0.9,
                ),
                child: SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorStyle.primary,
                                ColorStyle.secondary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
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
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Bukti Foto'),
                              const SizedBox(height: 6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocBuilder<
                                    ReimbursmentBloc,
                                    ReimbursmentState
                                  >(
                                    buildWhen:
                                        (previous, current) =>
                                            previous.images != current.images,
                                    builder: (context, state) {
                                      if (state.images.isEmpty) {
                                        return const SizedBox.shrink();
                                      }

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            for (final entry
                                                in state.images.asMap().entries)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 12,
                                                ),
                                                child: _ImagePreview(
                                                  index: entry.key,
                                                  image: entry.value,
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () async {
                                      final picker = ImagePicker();
                                      final files = await picker.pickMultiImage(
                                        imageQuality: 100,
                                      );
                                      if (files.isEmpty) return;

                                      final picked = await Future.wait(
                                        files.map((file) async {
                                          final bytes =
                                              await file.readAsBytes();
                                          return PickedImage(
                                            path: file.path,
                                            bytes: bytes,
                                            name: file.name,
                                            size: bytes.length,
                                          );
                                        }),
                                      );

                                      if (!context.mounted) return;

                                      final navigator = Navigator.of(context);
                                      if (!navigator.mounted) return;

                                      context.read<ReimbursmentBloc>().add(
                                        ReimbursmentImagesAdded(picked),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        border: Border.all(
                                          color: ColorStyle.greyRadioButton,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Text('Nominal'),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: _nominalController,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyle.black,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                onChanged: (value) {
                                  if (value == '') return;
                                  context.read<ReimbursmentBloc>().add(
                                    ReimbursmentNominalChanged(value),
                                  );
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan nominal disini',
                                  fillColor: ColorStyle.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text('Keterangan'),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: _informationController,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyle.black,
                                  fontSize: 12,
                                ),
                                maxLines: 3,
                                onChanged: (value) {
                                  if (value == '') return;
                                  context.read<ReimbursmentBloc>().add(
                                    ReimbursmentInformationChanged(value),
                                  );
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Masukkan keterangan pengajuan',
                                  fillColor: ColorStyle.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide: BorderSide(
                                      color: ColorStyle.greyRadioButton,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 40,
                                child: ButtonCustom(
                                  padding: EdgeInsets.zero,
                                  gradientColor: const [
                                    ColorStyle.primary,
                                    ColorStyle.secondary,
                                  ],
                                  isGradient: true,
                                  onPressed: () {
                                    final bloc =
                                        context.read<ReimbursmentBloc>();
                                    final information =
                                        bloc.state.informationText ?? '';
                                    final nominal =
                                        bloc.state.nominalText ?? '';
                                    final images = bloc.state.images;

                                    bloc.add(
                                      ReimbursmentSaveEvidence(
                                        information,
                                        nominal,
                                        images,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  name: 'Simpan',
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: ColorStyle.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddEvidenceCallToAction extends StatelessWidget {
  const _AddEvidenceCallToAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: ColorStyle.greyRadioButton,
        strokeWidth: 2,
        dashPattern: const [6, 3],
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add_circle_outline, color: ColorStyle.grey7),
              SizedBox(height: 8),
              Text(
                'Tambah bukti dan nominal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                'PNG, JPG hingga 5MB',
                style: TextStyle(fontSize: 12, color: ColorStyle.grey7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EvidenceTile extends StatelessWidget {
  const _EvidenceTile({
    required this.evidence,
    required this.index,
    required this.onTap,
  });

  final Evidence evidence;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final images = evidence.newImages ?? const <PickedImage>[];

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: ColorStyle.greyRadioButton),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images.isNotEmpty) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final image in images)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _ReadOnlyThumbnail(image: image),
                    ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (evidence.information ?? '').isNotEmpty
                            ? evidence.information!
                            : '-',
                        style: const TextStyle(
                          color: ColorStyle.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        (evidence.nominal ?? '').isNotEmpty
                            ? evidence.nominal!
                            : '-',
                        style: const TextStyle(
                          color: ColorStyle.grey7,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    context.read<ReimbursmentBloc>().add(
                      ReimbursmentListEvidenceRemovedAt(index),
                    );
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 16,
                    color: ColorStyle.grey7,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadOnlyThumbnail extends StatelessWidget {
  const _ReadOnlyThumbnail({required this.image});

  final PickedImage image;

  @override
  Widget build(BuildContext context) {
    const double size = 64;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: size,
        height: size,
        child: _buildImageWidget(image, size),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({required this.index, required this.image});

  final int index;
  final PickedImage image;

  @override
  Widget build(BuildContext context) {
    const double size = 72;
    Widget preview;

    if (image.bytes != null && image.bytes!.isNotEmpty) {
      preview = Image.memory(
        image.bytes!,
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    } else {
      preview = Container(
        color: ColorStyle.greyRadioButton,
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported,
          color: ColorStyle.white,
          size: 20,
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(width: size, height: size, child: preview),
        ),
        Positioned.fill(
          child: Align(
            child: GestureDetector(
              onTap: () {
                context.read<ReimbursmentBloc>().add(
                  ReimbursmentImageRemovedAt(index),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildImageWidget(PickedImage image, double size) {
  if (image.bytes != null && image.bytes!.isNotEmpty) {
    return Image.memory(
      image.bytes!,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }

  return Container(
    width: size,
    height: size,
    color: ColorStyle.greyRadioButton,
    alignment: Alignment.center,
    child: const Icon(
      Icons.image_not_supported,
      color: ColorStyle.white,
      size: 20,
    ),
  );
}
