import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'supplier_detail.dart';

class SupplierDetailPage extends StatelessWidget {
  const SupplierDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: customAppBar(),
      backgroundColor: VColor.background,
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: marginSmall),
          Expanded(
            child: ListView(
              children: const [
                DetailItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: const EdgeInsets.all(paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  VText(
                    "Dashboard",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: VColor.white,
                  ),
                  VText(
                    "Supplier",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: VColor.white,
                  ),
                  const VText(
                    "View",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Supplier Master - Supplier A",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Column(
            children: [
              VButton(
                "CREATE",
                buttonColor: VColor.secondary,
                leftIcon: const Icon(
                  Icons.add,
                  color: VColor.white,
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({super.key});

  Widget detailField(String title, String field) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: VText(title),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: VText(field),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                detailField("Code", "Code Item"),
                const SizedBox(height: marginExtraLarge),
                detailField("Name", "Item Name"),
                const SizedBox(height: marginExtraLarge),
                detailField("Address", "Code Item"),
                const SizedBox(height: marginExtraLarge),
                detailField("Email", "Code Item"),
                const SizedBox(height: marginExtraLarge),
                detailField("Phone", "Code Item"),
                const SizedBox(height: marginExtraLarge),
                detailField("Supplier Type", "Code Item"),
                const SizedBox(height: marginExtraLarge),
                detailField("Description", "Code Item"),
              ],
            ),
          ),
          const SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                active(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget active() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: VText("Active"),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GetBuilder<SupplierDetailController>(
                  builder: (controller) => VCheckbox(
                    isChecked: controller.isActive,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}