using Gdk;

namespace Smth {
	[GtkTemplate (ui = "/org/gtk/smth/window.ui")]
	public class Window : Gtk.ApplicationWindow {
		[GtkChild]
		Gtk.Label label;

		public Window (Gtk.Application app) {
			Object (application: app);
            //this.set_keep_above(true);
            string path = "code/other/launcher/proj/smth/src/styleapp1.css";
            this.set_app_paintable(true);

            var css_provider = new Gtk.CssProvider();
                css_provider.load_from_path(path);
                Gtk.StyleContext.add_provider_for_screen(screen, css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

            label.get_style_context().add_class("my_class");
            get_style_context().add_class("win");
            this.screen_changed.connect (fix_visual);
            fix_visual();
            this.screen.composited_changed.connect(this.schange);
		}

		private void fix_visual() {
            var visual = this.screen.get_rgba_visual ();

            if (visual == null) {
                warning ("compositing not available");
            } else {
                this.set_visual(visual);
            }

		}
		private void schange() {
            this.fix_visual();
		}
    }



}
