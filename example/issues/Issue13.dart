//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, May 25, 2012  5:00:33 PM
// Author: tomyeh

#import("dart:math");

#import('../../lib/app.dart');
#import('../../lib/view.dart');
#import('../../lib/model.dart');

class Issue13 extends Activity {

  void onCreate_() {
    mainView.layout.text = "type: linear; orient: vertical";

    //prepare data
    final DefaultListModel<String> model
      = new DefaultListModel(["apple", "orange", "lemon", "juice"]);
    model.addToSelection("orange");
    model.addToDisables("juice");

    final rg = new RadioGroup();
    mainView.addChild(rg);

    final btn = new Button("test");
    btn.on.click.add((event) {
      rg.model = model;
      mainView.requestLayout(immediate: true);
      mainView.addChild(
        new TextView(rg.node.query('input') != null ?
          "Success!":
          "Wrong! requestLayout+immediate shall force model to render immediately"));
      mainView.requestLayout();
    });
    mainView.addChild(btn);
  }
}

void main() {
  new Issue13().run();
}