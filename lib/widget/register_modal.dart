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
    return Column(
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
        FieldModelWidget(hint: "Imngresa el tipo", controller: _typeController),
        _buildButtonApp()
      ],
    );
  }
}
