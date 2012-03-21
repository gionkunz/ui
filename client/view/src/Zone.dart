//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//Jan. 09, 2012

/** A zone is a view implementing ID space ([IdSpace]).
 */
class Zone extends View implements IdSpace {
	//The fellows. Used only if this is IdSpace
	Map<String, View> _fellows;

	Zone() {
	  _fellows = {};
		vclass = "v-Zone";
	}

	View getFellow(String id) => _fellows[id];
	void bindFellow_(String id, View fellow) {
		if (fellow !== null) _fellows[id] = fellow;
		else _fellows.remove(id);
	}

	/** Returns the HTML tag's name representing this widget.
	 * <p>Default: <code>section</code>.
	 */
	String get domTag_() => "section";
}