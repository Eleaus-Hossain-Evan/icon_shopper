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
    this.defaultWidget,
    this.editIcon = true,
    this.deleteIcon = true,
    this.builder,
    this.onTapUploadImage,
  });

  final ValueNotifier<File?> imageFile;
  final String imagePath;
  final Widget? defaultWidget;
  final bool editIcon, deleteIcon;
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

    void pickingImage() => kShowBottomSheet(
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

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          KInkWell(
            onTap: pickingImage,
            borderRadius: BorderRadius.circular(72.w),
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
                            ? defaultWidget ??
                                Icon(
                                  Icons.person,
                                  size: 68.sp,
                                  color: context.colors.secondaryContainer,
                                )
                            : null,
                      )
                    : imageFile.value == null && imagePath.isEmpty
                        ? defaultWidget ??
                            Icon(
                              Icons.person,
                              size: 68.sp,
                              color: context.colors.secondaryContainer,
                            )
                        : KUserAvatar(
                            radius: 64.w,
                            enableBorder: true,
                            imageFile: imageFile.value,
                          ),
                Visibility(
                  visible: editIcon,
                  child: PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: IconButton(
                      onPressed: pickingImage,
                      padding: EdgeInsets.zero,
                      icon: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: AppColors.secondary,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: deleteIcon && imageFile.value != null,
                  child: PositionedDirectional(
                    bottom: 0,
                    start: 0,
                    child: IconButton(
                      onPressed: () {
                        imageFile.value = null;
                      },
                      padding: EdgeInsets.zero,
                      icon: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          radius: 14.r,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
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
