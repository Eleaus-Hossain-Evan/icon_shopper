import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';
import 'k_button.dart';
import 'k_inkwell.dart';
import 'k_modal_bottom_sheet.dart';

class ImagePickWidget extends HookConsumerWidget {
  const ImagePickWidget({
    super.key,
    required this.imageFile,
    required this.imagePath,
    required this.defaultWidget,
    this.editIcon = false,
    this.builder,
    this.onTapUploadImage,
  });

  final ValueNotifier<File?> imageFile;
  final String imagePath;
  final Widget defaultWidget;
  final bool editIcon;
  final Widget Function(ImageProvider<Object>?, Widget?)? builder;
  final Function(File)? onTapUploadImage;

  @override
  Widget build(BuildContext context, ref) {
    void chooseImage(type) async {
      XFile? image;
      if (type == "camera") {
        image = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 10);
      } else {
        image = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 25);
      }
      if (image != null) {
        imageFile.value = File(image.path);

        Logger.v(imageFile.value!.path);
      }
    }

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          KInkWell(
            onTap: () {
              kShowBottomSheet(
                context: context,
                child: ImagePickOptionWidget(
                  onCameraTap: () {
                    chooseImage("camera");

                    Navigator.pop(context);
                  },
                  onGalleryTap: () {
                    chooseImage("gallery");

                    Navigator.pop(context);
                    Logger.v("gallery");
                  },
                ),
              );
            },
            child: Stack(
              children: [
                builder != null
                    ? builder!(
                        imageFile.value != null
                            ? Image.file(imageFile.value!).image
                            : imagePath.isNotEmpty
                                ? CachedNetworkImageProvider(imagePath)
                                : null,
                        imageFile.value == null && imagePath.isEmpty
                            ? defaultWidget
                            : null,
                      )
                    : KUserAvatar(
                        radius: 48.w,
                        enableBorder: true,
                        icon: imageFile.value == null && imagePath.isEmpty
                            ? defaultWidget
                            : null,
                      ),
                Visibility(
                  visible: editIcon,
                  child: PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: 16.r,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTapUploadImage != null
              ? imageFile.value != null
                  ? KFilledButton(
                      text: "Upload Image",
                      onPressed: () => onTapUploadImage!(imageFile.value!),
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .6,
                      ),
                    ).w(150.w).centered().h(42.h).py16()
                  : const SizedBox.shrink()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class ImagePickOptionWidget extends StatelessWidget {
  const ImagePickOptionWidget({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          gap24,
          Text(
            AppStrings.choiceImageSource,
            style: context.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          gap10,
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              KInkWell(
                borderRadius: radius10,
                onTap: () => onCameraTap(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera,
                        color: context.colors.secondary,
                        size: 60.sp,
                      ),
                      Text(
                        AppStrings.fromCamera,
                        style: context.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              gap20,
              KInkWell(
                borderRadius: radius10,
                onTap: () => onGalleryTap(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        color: context.colors.secondary,
                        size: 60.sp,
                      ),
                      Text(
                        AppStrings.fromGallery,
                        style: context.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gap20,
        ],
      ),
    );
  }
}
