import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'item_detail.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

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
      padding: EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: marginSmall,
          ),
          Expanded(
            child: ListView(
              children: [
                _detailItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: EdgeInsets.all(paddingMedium),
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
                    "Item",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: marginSuperSmall,
              ),
              VText(
                "Master Item View - Item 0",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  VButton(
                    "Back",
                    buttonColor: VColor.platinum,
                    leftIcon: const Icon(
                      Icons.list,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: marginMedium),
                  VButton(
                    "Update",
                    buttonColor: VColor.secondary,
                    leftIcon: const Icon(
                      Icons.edit,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      VNavigation().toItemCreatePage();
                    },
                  ),
                  SizedBox(width: marginMedium),
                  VButton(
                    "Delete",
                    buttonColor: VColor.red,
                    leftIcon: const Icon(
                      Icons.delete,
                      color: VColor.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _detailItem() {
    Widget detailField(String title, String field) {
      return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: VText(title),
            ),
            SizedBox(
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

    Widget haveVariant() {
      return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: VText("Have Variant"),
            ),
            SizedBox(
              width: marginMedium,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<ItemDetailController>(
                    builder: (controller) => VCheckbox(
                      isChecked: controller.isHaveVariant,
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

    Widget active() {
      return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: VText("Active"),
            ),
            SizedBox(
              width: marginMedium,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<ItemDetailController>(
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

    return Container(
      padding: EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                detailField("Code", "Code Item"),
                SizedBox(height: marginExtraLarge),
                detailField("Name", "Item Name"),
                SizedBox(height: marginExtraLarge),
                detailField("Item Category", "Code Item"),
                SizedBox(height: marginExtraLarge),
                detailField("Customer Tax", "Pajak Pertambahan 0% (0%)"),
                SizedBox(height: marginExtraLarge),
                detailField("Supplier Tax", "Pajak Pertambahan 0% (0%)"),
                SizedBox(height: marginExtraLarge),
                haveVariant(),
                SizedBox(height: marginExtraLarge),
              ],
            ),
          ),
          SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VText("Item Picture"),
                SizedBox(height: marginExtraLarge),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const Center(child: VText("Item Image")),
                ),
                SizedBox(height: marginExtraLarge),
                active(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}