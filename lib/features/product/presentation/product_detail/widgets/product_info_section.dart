import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../../common/presentation/html_text_widget.dart';
import '../../../application/product_provider.dart';

class ProductInfoSection extends HookConsumerWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);

    final tabController =
        useTabController(initialLength: ProductInfoSectionEnum.values.length);
    final currentTabIndex = useState(0);

    return Column(
      mainAxisSize: mainMin,
      children: [
        TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: EdgeInsets.zero,
          tabs: ProductInfoSectionEnum.values
              .map((e) => Tab(
                  child: e.name
                      .toTitleCaseFromCamel()
                      .text
                      .lg
                      .letterSpacing(.6)
                      .make()))
              .toList(),
          onTap: (value) => currentTabIndex.value = value,
        ).color(AppColors.bg200).card.elevation(2).make(),
        gap6,
        [
          HtmlTextWidget(text: state.description),
          HtmlTextWidget(text: state.guideline),
          HtmlTextWidget(text: state.sizeChart),
        ][currentTabIndex.value]
            .px16(),
      ],
    );
  }
}
