---
layout: default
title: Seminare & Zertifikate
---

{% include header.html type="page" %}

<div class="container" role="main">

{% for certificate in site.certificates %}

  {% assign index_remainder = forloop.index0 | modulo:2 %}

  {% if index_remainder == 0 %}
  <div class="row">
    <div class="col-lg-4 col-lg-offset-2 col-md-5 col-md-offset-1">
  {% else %}
    <div class="col-lg-4 col-md-5">
  {% endif %}

  {% assign certificate_image = "/" | append: certificate.collection | append: "/" | append: certificate.image %}

  {% include card.html title=certificate.title subtitle=certificate.organization image=certificate_image text=certificate.content %}


  {% if index_remainder == 1 %}
  </div>
  {% endif %}

{% endfor %}

{% assign collection_modulo = forloop.length | modulo: 2%}

{% if collection_modulo == 1 %}
  </div>
{% endif %}

</div>
