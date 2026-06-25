---
layout: page
title: Alumni
permalink: /alumni/
---

This page lists former doctoral students, postdoctoral fellows, and other research associates who have worked in this group and have coauthored at least one research paper or case study.

The alumni directory is intended to document the academic and professional journeys of people associated with the SIGNAL Lab and to help future students, collaborators, and alumni understand the range of research areas connected with the group.

{% assign phd_alumni = site.data.alumni | where: "category", "phd" %}
{% assign postdoc_alumni = site.data.alumni | where: "category", "postdoc" %}
{% assign other_alumni = site.data.alumni | where: "category", "other" %}

{% if phd_alumni.size > 0 %}
<section class="member-section">
  <h2>PhD students</h2>

  <div class="member-grid">
  {% for person in phd_alumni %}
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
            <a href="{{ person.webpage }}" target="_blank" rel="noopener">Webpage / LinkedIn</a>
          {% endif %}

          {% if person.profile and person.profile != "#" %}
            <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
          {% endif %}
        </div>
      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}

{% if postdoc_alumni.size > 0 %}
<section class="member-section">
  <h2>Postdoctoral fellows</h2>

  <div class="member-grid">
  {% for person in postdoc_alumni %}
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
            <a href="{{ person.webpage }}" target="_blank" rel="noopener">Webpage / LinkedIn</a>
          {% endif %}

          {% if person.profile and person.profile != "#" %}
            <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
          {% endif %}
        </div>
      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}

{% if other_alumni.size > 0 %}
<section class="member-section">
  <h2>Other notable research assistants</h2>

  <div class="member-grid">
  {% for person in other_alumni %}
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
            <a href="{{ person.webpage }}" target="_blank" rel="noopener">Webpage / LinkedIn</a>
          {% endif %}

          {% if person.profile and person.profile != "#" %}
            <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
          {% endif %}
        </div>
      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}

If you are an alumnus of this group and want your information to be added/modified, please send an email to [soudeeps.research.group@gmail.com](mailto:soudeeps.research.group@gmail.com).