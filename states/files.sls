{% for file, content in salt['pillar.get']('foobar:config', {}).iteritems() %}
/tmp/{{file}}:
  file.managed:
    - source: salt://files/filetemplate.j2
    - template: jinja
    - context:
        config: {{ content |default({}) }}
{% endfor %}
