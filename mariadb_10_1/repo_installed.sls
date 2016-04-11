{% if grains['os_family']=="RedHat" %}

{% if grains['os'] == "CentOS" %}
{%   set gr_os = "centos"  %}
{% elif grains['os'] == "Fedora" %}
{%   set gr_os = "fedora"  %}
{% endif %}

{% if grains['cpuarch']=="x86" %}
{%   set gr_cpu   = "x86" %}       
{% endif %}

{% if grains['cpuarch']=="x86_64" %}
{%   set gr_cpu   = "amd64" %}              
{% endif %}

{% set gr_fam   = grains['os_family'] %}
{% set gr_osmr  = grains['osmajorrelease']%}
repo_installed:
    pkgrepo.managed:
        - name: MariaDB10.1
        - humanname: MariaDB10.1 Repository
        - baseurl: http://yum.mariadb.org/10.1/{{ gr_os }}{{ gr_osmr }}-{{ gr_cpu }}
        - gpgkey: https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
        - gpgcheck: 1
        - comments:
            - '#Added by SaltStack'
{% endif %} {## Redhat #}

