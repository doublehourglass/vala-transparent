smth_sources = [
  'main.vala',
  'window.vala',
]

smth_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

smth_sources += gnome.compile_resources('smth-resources',
  'smth.gresource.xml',
  c_name: 'smth'
)

executable('smth', smth_sources,
  vala_args: '--target-glib=2.50',  dependencies: smth_deps,
  install: true,
)
