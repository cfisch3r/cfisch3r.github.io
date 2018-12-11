---
layout: page
title: Veranstaltungen
subtitle: Vorträge & Trainings
bigimg: /assets/training.jpg
---



<ul class="fa-ul">
{% assign events = site.events | sort: 'event_date' | reverse %}
{% for event in events %}
  {% if event.event_type == "training" %}
    {% assign icon = 'fa-graduation-cap' %}
  {% else %}
    {% assign icon = 'fa-television' %}
  {% endif %}

  <li>
    <h3><i class="fa-li fa {{ icon }}"></i><a href="{{ event.url }}">{{ event.title }}</a></h3>
          <i class="fa fa-calendar"></i> {{ event.event_date | date: "%-d. %B, %Y" }}
          &nbsp;
          <i class="fa fa-map-marker"></i> {{ event.event_name }}
  </li>
{% endfor %}
</ul>
