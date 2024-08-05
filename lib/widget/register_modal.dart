import 'package:appgastos/widget/field_model_widget.dart';
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
  _buildButtonApp() {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Añadir",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34))),
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
            funcion: () {
              print("es una fehca");
            },
          ),
          _buildButtonApp()
        ],
      ),
    );
  }
}
