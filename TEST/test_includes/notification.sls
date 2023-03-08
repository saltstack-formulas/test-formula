# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "../map.jinja" import mapdata as TEST with context %}

include:
  {#- Use Jinja to construct the relevant include using dots or slashes,
      where `TEST.test_includes.include_notation` is either `.` or `/`.

      Dot notation is used throughout the SaltStack Formulas organisation, i.e.:
      - TEST.test_includes.package

      Slash notation is mentioned in the bug report (https://github.com/saltstack/salt/pull/61659), i.e.
      - TEST/test_includes/package
  #}
  - {{ ["TEST", "test_includes", "package"] | join(TEST.test_includes.include_notation) }}

TEST/test_includes/notification/test.show_notification:
  test.show_notification:
    - text: Package installed
    - require:
      - pkg: TEST/test_includes/package/pkg.installed
