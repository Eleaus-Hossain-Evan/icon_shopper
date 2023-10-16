import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../auth/application/auth_provider.dart';

class ProfileDetailScreen extends HookConsumerWidget {
  static const route = '/profile-detail';

  const ProfileDetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    final isLoading = useState(false);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    //. Image File
    final imageFile = useState<File?>(null);

    //. Controllers
    final nameController = useTextEditingController(text: state.user.name);
    final emailController = useTextEditingController(text: state.user.email);
    final phoneController = useTextEditingController(text: state.user.phone);
    final infoController =
        useTextEditingController(text: state.user.information);

    //. Refresh Controller
    final refreshController = useMemoized(
        () => RefreshController(initialLoadStatus: LoadStatus.canLoading));

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Profile Detail',
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () => ref
            .refresh(authProvider.notifier)
            .profileView()
            .then((_) => refreshController.refreshCompleted()),
        child: SingleChildScrollView(
          padding: padding16,
          child: Column(
            children: [
              //. Login Form
              ContainerBGWhiteSlideFromTop(
                bgColor: AppColors.bg200,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ImagePickWidget(
                        imageFile: imageFile,
                        imagePath: state.user.avatar,
                        defaultWidget: Icon(
                          Icons.person,
                          size: 68.sp,
                          color: context.colors.secondaryContainer,
                        ),
                        editIcon: true,
                      ),
                      gap24,
                      //. Name
                      KTextFormField2(
                        containerPadding: padding0,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.name,
                      ),
                      gap16,

                      //. Email
                      KTextFormField2(
                        containerPadding: padding0,
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.email,
                      ),
                      gap16,

                      //. Phone Number
                      KTextFormField2(
                        containerPadding: padding0,
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.phoneNumber,
                        readOnly: true,
                      ),
                      gap16,

                      //. Information
                      KTextFormField2(
                        containerPadding: padding0,
                        controller: infoController,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.information,
                      ),
                      gap16,

                      //. Update profile Button
                      KFilledButton(
                        loading: isLoading.value,
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          isLoading.value = true;
                          FocusScope.of(context).unfocus();
                          ref
                              .read(authProvider.notifier)
                              .updateProfile(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                information: infoController.text,
                                avatar: imageFile.value,
                              )
                              .then((value) => isLoading.value = false);
                        },
                        text: AppStrings.updateProfile,
                      ),
                      gap8,
                    ],
                  ),
                ),
              ),
              gap24,
            ],
          ),
        ),
      ),
    );
  }
}
