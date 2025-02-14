import 'package:flutter/material.dart';
import 'package:nvvmproject/configs/theme.dart';
import 'package:provider/provider.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    final themeApp = context.watch<ThemeApp>();
    return Column(
      children: [
        SwitchListTile(
          title: Text('Modo noturno'),
          value: themeApp.themeOn,
          onChanged: themeApp.mudarThema,
        )
      ],
    );
  }
}
