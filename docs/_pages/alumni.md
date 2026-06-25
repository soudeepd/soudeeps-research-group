---
layout: page
title: Alumni
permalink: /alumni/
---

# Alumni

This page lists former doctoral students, postdoctoral fellows, and other research assistants who have worked with Prof. Soudeep Deb and have coauthored at least one research paper or case study.

The alumni directory is intended to document the academic and professional journeys of people associated with the group and to help future students, collaborators, and alumni understand the range of research areas connected with the group.

<div class="member-grid">
{% for person in site.data.alumni %}
  <article class="member-card">
    {% if person.image %}
      <img class="member-photo" src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    {% endif %}

    <div class="member-info">
      <h3>{{ person.name }}</h3>

      {% if person.role %}
        <p class="member-role">{{ person.role }}</p>
      {% endif %}

      {% if person.period %}
        <p class="member-meta">{{ person.period }}</p>
      {% endif %}

      {% if person.current %}
        <p class="member-current">{{ person.current }}</p>
      {% endif %}

      {% if person.themes %}
        <p class="member-tags">{{ person.themes }}</p>
      {% endif %}

      <div class="member-actions">
        {% if person.webpage %}
          <a href="{{ person.webpage }}" target="_blank" rel="noopener">Webpage</a>
        {% endif %}

        {% if person.profile and person.profile != "#" %}
          <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
        {% endif %}
      </div>
    </div>
  </article>
{% endfor %}
</div>

If you are an alumnus of this group and want your information to be added/modified, please send an email to [soudeeps.research.group@gmail.com](mailto:soudeeps.research.group@gmail.com).