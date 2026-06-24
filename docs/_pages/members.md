---
layout: page
title: Current members
permalink: /members/
---

# Current members

The following members are currently working in the SIGNAL Lab in various capacities.

<div class="alumni-list">
{% for person in site.data.alumni %}
  <div class="alumni-card">
    <img src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    <div>
      <h3>{{ person.name }}</h3>
      <p><strong>Association with the group:</strong> {{ person.association }}</p>
      <p><strong>Period:</strong> {{ person.period }}</p>
      <p><strong>Thesis / project:</strong> {{ person.project }}</p>
      <p><strong>Research themes:</strong> {{ person.themes }}</p>
      <p><strong>Current position:</strong> {{ person.current_position }}</p>
      <p>{{ person.bio }}</p>

      {% if person.links %}
      <p>
        {% for link in person.links %}
          <a href="{{ link.url }}">{{ link.label }}</a>{% unless forloop.last %} · {% endunless %}
        {% endfor %}
      </p>
      {% endif %}
    </div>
  </div>
{% endfor %}
</div>

If you are an alumnus of this group and want your information to be added/modified, please send an email to [soudeeps.research.group@gmail.com](mailto:soudeeps.research.group@gmail.com).
