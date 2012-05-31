//Sample Code: Input Samples

#import('../../client/app/app.dart');
#import('../../client/view/view.dart');

class InputSamples extends Activity {

	void onCreate_() {
		title = "Input Samples";

		mainView.layout.text = "type: linear; orient: vertical";

		for (final String type in
		["text", "password", "multiline", "date", "color"]) {
			View view = new View();
			view.layout.text = "type: linear";
			mainView.addChild(view);

			final TextView label = new TextView(type);
			label.style.textAlign = "right";
			label.profile.width = "70";
			view.addChild(label);
			view.addChild(new TextBox(type: type));
		}
	}
}

void main() {
	new InputSamples().run();
}
