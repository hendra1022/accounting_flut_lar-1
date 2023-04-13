import 'dart:math';

import 'package:akuntansi_flut/modules/purchase/detail/purchase_detail.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/item_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';

class PurchaseLineTable extends StatelessWidget {
  const PurchaseLineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseDetailController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: VColor.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(radiusMedium),
                ),
              ),
              child: Theme(
                data: Theme.of(Get.context!).copyWith(cardColor: VColor.white, dividerColor: VColor.primary),
                child: PaginatedDataTable(
                  source: controller.dataSource,
                  showFirstLastButtons: true,
                  primary: true,
                  columnSpacing: 10,
                  horizontalMargin: 10,
                  rowsPerPage: controller.dataSource.rowCount >= 15 ? 15 : controller.dataSource.rowCount,
                  showCheckboxColumn: false,
                  columns: [
                    tableColumn(controller, "Code", (user) => user.code!, minWidth: Get.width * (4 / 100)),
                    tableColumn(controller, "Item Name", (user) => user.name!, minWidth: Get.width * (24 / 100)),
                    tableColumn(controller, "Item Category", (user) => user.active!, minWidth: Get.width * (8 / 100)),
                    tableColumn(controller, "Price", (user) => user.active!, minWidth: Get.width * (8 / 100)),
                    tableColumn(controller, "Qty", (user) => user.active!, minWidth: Get.width * (8 / 100)),
                    tableColumn(controller, " ", null, minWidth: Get.width * (8 / 100)),
                  ],
                ),
              ),
            ),
    );
  }

  DataColumn tableColumn<T>(
    PurchaseDetailController controller,
    String title,
    Comparable<T> Function(ItemModel user)? sortBy, {
    double minWidth = 100.0,
  }) {
    return DataColumn(
      label: SizedBox(
        width: minWidth,
        child: VText(
          title,
          align: TextAlign.left,
          overflow: TextOverflow.clip,
        ),
      ),
      onSort: sortBy != null ? (columnIndex, ascending) => controller.sortData(sortBy, columnIndex, ascending) : null,
    );
  }
}

class PurchaseLineDataTableSource extends DataTableSource {
  // Generate some made-up data
  final List<ItemModel> _data = List.generate(
    10,
    (index) => ItemModel(
      id: index.toString(),
      code: index.toString(),
      name: "item $index",
      categoryId: "1",
      categoryName: "Demo",
      active: "1",
      minPrice: "${Random().nextInt(50000)}",
      price: "${Random().nextInt(50000)}",
      createdDate: "2023-01-01",
      updatedDate: "2023-01-01",
    ),
  );

  void sort<T>(Comparable<T> Function(ItemModel d) getField, bool ascending) {
    _data.sort((ItemModel a, ItemModel b) {
      if (!ascending) {
        final ItemModel c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      color: index % 2 == 1 ? MaterialStateColor.resolveWith((states) => VColor.grey4Opacity) : MaterialStateColor.resolveWith((states) => VColor.transparant),
      cells: [
        dataCell(_data[index].code, Get.width * (4 / 100), flex: 1),
        dataCell(_data[index].name, Get.width * (24 / 100), flex: 6),
        dataCell(_data[index].categoryName, Get.width * (8 / 100), flex: 6),
        dataCell(_data[index].price, Get.width * (8 / 100), flex: 6),
        dataCell(_data[index].qty, Get.width * (8 / 100), flex: 6),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (8 / 100),
            ),
            // width: Get.width * (4 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  hoverColor: VColor.transparant,
                  onPressed: () {
                    VNavigation().toPurchaseDetailPage(int.parse(_data[index].id!));
                  },
                  icon: const Icon(Icons.ads_click, color: VColor.black),
                ),
                IconButton(
                  hoverColor: VColor.transparant,
                  onPressed: () {
                    VNavigation().toPurchaseCreatePage();
                  },
                  icon: const Icon(Icons.edit, color: VColor.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DataCell dataCell(String? text, double width, {int flex = 1}) {
    return DataCell(
      Container(
        constraints: BoxConstraints(minWidth: width),
        // width: width,
        padding: const EdgeInsets.only(right: 5),
        child: VText(text ?? "null", align: TextAlign.left),
      ),
    );
  }
}