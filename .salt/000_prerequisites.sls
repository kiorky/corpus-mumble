{% set cfg = opts.ms_project %}
{% set data = cfg.data %}
{% set db = cfg.data.db %}
include:
  - makina-states.services.sound.mumble

{{cfg.name}}-www-data:
  user.present:
    - name: www-data
    - optional_groups:
      - {{cfg.group}}
    - remove_groups: false

prepreqs-{{cfg.name}}:
  pkg.installed:
    - watch:
      - user: {{cfg.name}}-www-data
    - pkgs:
      - sqlite3
      - libsqlite3-dev
      - python-dbus
      - python-dbus-dev
      - apache2-utils
      - python-zeroc-ice
      - autoconf
      - automake
      - mercurial
      - build-essential
      - bzip2
      - gettext
      - git
      - groff
      - libbz2-dev
      - libdb-dev
      - libgdbm-dev
      - libreadline-dev
      - libfreetype6-dev
      - libsigc++-2.0-dev
      - libsqlite0-dev
      - libsqlite3-dev
      - libtiff5
      - libtiff5-dev
      - libwebp5
      - libwebp-dev
      - libssl-dev
      - libtool
      - libxml2-dev
      - libxslt1-dev
      - libopenjpeg-dev
      - libopenjpeg2
      - m4
      - man-db
      - pkg-config
      - poppler-utils
      - python-dev
      - python-imaging
      - python-setuptools
      - tcl8.4
      - tcl8.4-dev
      - tcl8.5
      - tcl8.5-dev
      - tk8.5-dev
      - wv
      - zlib1g-dev

{{cfg.name}}-dirs:
  file.directory:
    - makedirs: true
    - user: {{cfg.user}}
    - group: {{cfg.group}}
    - watch:
      - pkg: prepreqs-{{cfg.name}}
    - names:
      - {{cfg.data_root}}/parts
      - {{cfg.data_root}}/eggs
      - {{cfg.data_root}}/cache
      - {{cfg.data.static}}
