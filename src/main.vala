int main (string[] args) {
	var app = new Gtk.Application ("org.gtk.smth", ApplicationFlags.FLAGS_NONE);
	app.activate.connect (() => {

		var win = app.active_window;
		if (win == null) {
			win = new Smth.Window (app);
		}
		win.present ();
    });
	return app.run (args);
}
