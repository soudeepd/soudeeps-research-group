---
layout: page
title: Alumni
permalink: /alumni/
---

# Alumni

This page lists former doctoral students, postdoctoral fellows, and other research assistants who have worked with Prof. Soudeep Deb and have coauthored at least one research paper or case study. The alumni directory is intended to document the academic and professional journeys of people associated with the group and to help future students, collaborators, and alumni understand the range of research areas connected with the group.

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
