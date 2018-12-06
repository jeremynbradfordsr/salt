pkgs:
  {% if grains[‘os_family’] == ‘Redhat’ %}
  apache: httpd
  {% elif grains[‘os_family’] == ‘Ubuntu’ %}
  apache: apache2
  {% elif grains[‘os’] == ‘Scientific’ %}
  apache: httpd
  {% endif %}
