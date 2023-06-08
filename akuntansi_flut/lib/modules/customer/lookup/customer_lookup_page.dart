import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/customer.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'customer_lookup.dart';

class CustomerLookUpPage extends StatelessWidget {
  const CustomerLookUpPage({super.key});

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
          const Filter(),
          const SizedBox(height: marginSmall),
          Expanded(
            child: GetBuilder<CustomerLookUpController>(
              builder: (controller) => controller.isLoading
                  ? const VLoadingPage()
                  : controller.customerList.isEmpty
                      ? const Center(
                          child: VText("Data is empty!"),
                        )
                      : Container(
                          padding: const EdgeInsets.all(paddingSmall),
                          decoration: BoxDecoration(color: VColor.white, borderRadius: BorderRadius.circular(radiusSmall)),
                          child: ListView.builder(
                            itemCount: controller.customerList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => _childList(controller.customerList[index]),
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _childList(Customer customer) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VText(customer.name ?? "-"),
              VIconButton(
                Icons.check,
                onPressed: () {
                  Get.back(result: {PrefConst.keyArgsCustomer: customer});
                },
              ),
            ],
          ),
          const Divider(
            color: VColor.grey1,
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
                    "Customer",
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
                "Customer LookUp",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          VButton(
            "Cancel",
            buttonColor: VColor.secondary,
            leftIcon: const Icon(
              Icons.cancel_outlined,
              color: VColor.white,
            ),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: VColor.white),
      padding: const EdgeInsets.all(marginMedium),
      child: Wrap(
        children: [
          filterStatus(),
          const SizedBox(
            width: 50,
          ),
          filterByDropdown(),
          const SizedBox(
            width: 50,
          ),
          createCustomer(),
          // const SizedBox(
          //   width: 50,
          // ),
        ],
      ),
    );
  }

  Widget filterStatus() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VText(
            "Status",
            fontSize: textSizeLarge,
            isBold: true,
          ),
          GetBuilder<CustomerLookUpController>(
            builder: (controller) => DropdownButton2(
              hint: const Padding(
                padding: EdgeInsets.only(left: paddingSuperSmall),
                child: VText(
                  'Select Item',
                  fontSize: textSizeMedium,
                  color: VColor.grey1,
                ),
              ),
              items: controller.filterStatusItems
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.only(left: paddingSuperSmall),
                        child: VText(
                          item,
                          fontSize: textSizeMedium,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: controller.selectedFilterStatus,
              onChanged: (value) {
                controller.selectedFilterStatus = value as String;
                controller.update();
              },
              buttonStyleData: const ButtonStyleData(
                height: 40,
                width: 100,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterByDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VText(
          "Search",
          fontSize: textSizeLarge,
          isBold: true,
        ),
        FittedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: VColor.white,
              borderRadius: BorderRadius.all(
                Radius.circular(radiusMedium),
              ),
            ),
            child: GetBuilder<CustomerLookUpController>(
              builder: (controller) => Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: VInputText(
                      hint: "Search item by ${controller.selectedFilterBy}",
                      textEditingController: controller.itemSearchController,
                      autoFocus: false,
                    ),
                  ),
                  const SizedBox(
                    width: marginSmall,
                  ),
                  VButton(
                    "Filter",
                    leftIcon: const Icon(
                      Icons.search,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      controller.search();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget createCustomer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VText(
          "Customer Name",
          isBold: true,
        ),
        FittedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: VColor.white,
              borderRadius: BorderRadius.all(
                Radius.circular(radiusMedium),
              ),
            ),
            child: GetBuilder<CustomerLookUpController>(
              builder: (controller) => Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: VInputText(
                      hint: "Customer Name",
                      textEditingController: controller.customerNameController,
                      autoFocus: false,
                    ),
                  ),
                  const SizedBox(
                    width: marginSmall,
                  ),
                  VButton(
                    "Create",
                    leftIcon: const Icon(
                      Icons.search,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      controller.createCustomer();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
