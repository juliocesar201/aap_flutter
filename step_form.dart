import 'package:flutter/material.dart';

import './page_indicator.dart';
import './page.body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stepFormState();
    // TODO: implemernt createState
  }
}

class _stepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;

  List _pagesList = [
    pageBody(
      'https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png',
      'Fluter',
      'Flutter é um framework (ferramenta) de desenvolvimento com foco multiplataforma, em dispositivos móveis. Criado pela Google, é bastante utilizado no mercado e, mais recentemente, permite a criação de aplicações para desktop (Linux, Windows e macOS). Vamos entender mais sobre isso?',
    ),
    pageBody(
      'https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png',
      'Na platica',
      'Na prática, o Flutter é uma ferramenta para desenvolver aplicativos em diferentes plataformas - Android e iOS - ao mesmo tempo com um único código. Logo, seus principais benefícios são a versatilidade, menor curva de aprendizado e agilidade.',
    ),
    pageBody(
      'https://miro.medium.com/max/1400/1*TFZQzyVAHLVXI_wNreokGA.png',
      'Multiplatadorma',
      'É extremamente vantajoso para as empresas, pois uma pessoa dev pode desenvolver aplicativos para sistemas operacionais diferentes, oposto ao modelo nativo, em que são necessários duas pessoas devs para cada plataforma.',
    ),
  ];

  void _changerStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });

      _stepFormController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });

      _stepFormController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Step App Page'),
        ),
        body: PageView.builder(
            controller: _stepFormController,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _pagesList[index];
            }),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => _changerStep(false),
              child: Text('anterior'),
            ),
            pageIndicator(_page == 0),
            pageIndicator(_page == 1),
            pageIndicator(_page == 2),
            FloatingActionButton(
              onPressed: () => _changerStep(true),
              child: Text('Proximo'),
            ),
          ],
        ));
  }
}
