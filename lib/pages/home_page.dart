import 'package:appgastos/db/db_admin.dart';
import 'package:appgastos/models/gasto_model.dart';
import 'package:appgastos/widget/item_gasto.dart';
import 'package:appgastos/widget/register_modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GastoModel> gastos = [];
  GastoModel gasto1 = GastoModel(
      title: "Titulo", price: 12, datetime: "12/1/12", type: "Alimentos");

  Widget busquedaWidget() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Buscar por titulo",
          hintStyle:
              TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 14),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          contentPadding: EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16))),
    );
  }

  void showRegisterModel() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RegisterModal(),
        );
      },
    ).then((value) {
      getDataFromDb();
    });
  }

  Future<void> getDataFromDb() async {
    gastos = await DBAdmin().obetenerGastos();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataFromDb();
    super.initState();
  }

  // DBAdmin dbAdmin = DBAdmin();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showRegisterModel();
                    // DBAdmin().insrtarGasto();
                    // showRegisterModel();
                  },
                  child: Container(
                    color: Colors.black,
                    height: 100,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Agregar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Resumen de gastos",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Gestiona tus datos",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45),
                        ),
                        busquedaWidget(),
                        Expanded(
                          child: ListView.builder(
                              itemCount: gastos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemGasto(gasto: gastos[index]);
                              }),
                        ),
                        // const ListTile(
                        //   title: Text("Compras en el super"),
                        //   subtitle: Text("14/01/2025 23:21"),
                        // ),
                        // ItemGasto(
                        //   gasto: gasto1,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
