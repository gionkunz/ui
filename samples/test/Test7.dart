//Sample Code: Layout Demostration

#import('dart:html');

#import('../../client/app/app.dart');
#import('../../client/view/view.dart');

class Test7 extends Activity {

	void onCreate_() {
		title = "Test 7: hlayout in hlayout";
		View view = new View();
		_setBorder(view);
		view.layout.type = "linear";
		view.layout.orient = "vertical";
		view.profile.width = view.profile.height = "flex";
		rootView.appendChild(view);

		TextView text = new TextView(html: '<h1 style="margin:0">$title</h1>');
		_setBorder(text);
		view.appendChild(text);

		text = new TextView("Description here");
		_setBorder(text);
		view.appendChild(text);
		
		_addOrientation(view);
		_addLogView(view);
	}
	void _addOrientation(View parent) {
		View view = new View();
		_setBorder(view);
		_setHLayout(view);
		parent.appendChild(view);

		TextView text = new TextView("Orientation");
		_setBorder(text);
		view.appendChild(text);

		CheckBox ckbox = new CheckBox("checkbox sample");
		_setBorder(ckbox);
		int clickCount = 0;
		ckbox.on.check.add((CheckEvent event) {
			ckbox.text = 'checked: ${event.checked} ${++clickCount}';
			ckbox.parent.requestLayout();
		});
		view.appendChild(ckbox);

		RadioGroup group = new RadioGroup();
			group.on.check.add((CheckEvent event) {
			event.target.text = 'checked: ${++clickCount}';
			event.target.parent.requestLayout();
		});
		_setHLayout(group);
		_setBorder(group);
		group.layout.spacing = "0 5";
		view.appendChild(group);

		RadioButton horz = new RadioButton("horizontal radio");
		_setBorder(horz);
		group.appendChild(horz);
		RadioButton vert = new RadioButton("vertical radio");
		_setBorder(vert);
		group.appendChild(vert);

		_addTextWithMaxWidth(view, 150);
	}
	void _addLogView(View view) {
		View logView = new View();
		logView.layout.type = "linear";
		logView.layout.orient = "vertical";
		logView.layout.spacing = "0";
		logView.profile.width = logView.profile.height = "flex";
		logView.style.backgroundColor = "#cca";
		_setBorder(logView);
		TextView text = new TextView(html: '<h2 style="margin:0">Log View</h2>');
		_setBorder(text);
		logView.appendChild(text);

		view.appendChild(logView);
	}
	void _setBorder(View view) {
		view.style.border = "1px solid black";
	}
	void _setHLayout(View view) {
		view.layout.type = "linear";
		view.layout.width = "content";
		view.profile.width = "flex";
		view.profile.height = "content";
	}
	void _addTextWithMaxWidth(View view, int maxWd) {
		TextView text = new TextView("This is limited by max-width:${maxWd}");
		_setBorder(text);
		text.profile.maxWidth = maxWd.toString();
		view.appendChild(text);
	}
}

void main() {
	new Test7().run();
}
