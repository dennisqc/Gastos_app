import 'package:appgastos/db/db_admin.dart';
import 'package:appgastos/models/gasto_model.dart';
import 'package:appgastos/util/data_general.dart';
import 'package:appgastos/widget/field_model_widget.dart';
import 'package:appgastos/widget/item_type.dart';
import 'package:flutter/material.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController _productController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String typeSelect = "Alimentos";
  _buildButtonApp() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          GastoModel gasto = GastoModel(
              title: _productController.text,
              price: double.parse(_productController.text),
              datetime: _dateController.text,
              type: _typeController.text);
          // Map<String, dynamic> gastoMap = {
          //   "title": _productController.text,
          //   "price": _priceController.text,
          //   "datetime": _dateController.text,
          //   "type": _typeController.text,

          // };
          DBAdmin().insrtarGasto(gasto).then((value) {
            if (value > 0) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.cyan,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                content: Text("Se registro"),
              ));
              Navigator.pop(context);
            }
          });
        },
        child: Text(
          "Añadir",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  showDateTimePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  dialogTheme: DialogTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  colorScheme: ColorScheme.light(primary: Colors.black)),
              child: child!);
        });
    _dateController.text = datePicker.toString();
    // if (datePicker != null) {
    //   final dateFormat;
    // }
    print(_dateController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Registra gasto",
            ),
            SizedBox(
              height: 16,
            ),
            FieldModelWidget(
                hint: "Imngresa el titulo", controller: _productController),
            FieldModelWidget(
              hint: "Imngresa el monto",
              controller: _priceController,
              isNumberKeyBoard: true,
            ),
            FieldModelWidget(
              hint: "Selecciona una fecha",
              controller: _dateController,
              isDatePicker: true,
              function: () {
                showDateTimePicker();
                print("es una fehca");
              },
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: types
                    .map((e) => ItemType(
                          data: e,
                          isSelected: e["name"] == typeSelect,
                          tap: () {
                            typeSelect = e["name"];
                            setState(() {});
                            print(typeSelect);
                          },
                        ))
                    .toList(),
              ),
            ),
            _buildButtonApp()
          ],
        ),
      ),
    );
  }
}
