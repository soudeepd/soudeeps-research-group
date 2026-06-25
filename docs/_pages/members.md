
---
layout: page
title: Members
permalink: /members/
---

# Members

Following are the current members of SIGNAL Lab, who are working in different capacities.

{% assign phd_members = site.data.members | where: "category", "phd" %}
{% assign postdoc_members = site.data.members | where: "category", "postdoc" %}
{% assign masters_members = site.data.members | where: "category", "masters" %}
{% assign other_members = site.data.members | where: "category", "other" %}

{% if phd_members.size > 0 %}
## PhD students

<div class="member-grid">
{% for person in phd_members %}
  <article class="member-card">
    {% if person.image %}
      <img class="member-photo" src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    {% endif %}

    <div class="member-info">
      <h3>{{ person.name }}</h3>

      {% if person.role %}
        <p class="member-role">{{ person.role }}</p>
      {% endif %}

      {% if person.themes %}
        <p class="member-tags">{{ person.themes }}</p>
      {% endif %}

      <div class="member-actions">
        {% if person.email %}
          <a href="mailto:{{ person.email }}">Email</a>
        {% endif %}

        {% if person.profile and person.profile != "#" %}
          <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
        {% endif %}
      </div>
    </div>
  </article>
{% endfor %}
</div>
{% endif %}

{% if postdoc_members.size > 0 %}
## Postdoctoral fellows

<div class="member-grid">
{% for person in postdoc_members %}
  <article class="member-card">
    {% if person.image %}
      <img class="member-photo" src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    {% endif %}

    <div class="member-info">
      <h3>{{ person.name }}</h3>

      {% if person.role %}
        <p class="member-role">{{ person.role }}</p>
      {% endif %}

      {% if person.themes %}
        <p class="member-tags">{{ person.themes }}</p>
      {% endif %}

      <div class="member-actions">
        {% if person.email %}
          <a href="mailto:{{ person.email }}">Email</a>
        {% endif %}

        {% if person.profile and person.profile != "#" %}
          <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
        {% endif %}
      </div>
    </div>
  </article>
{% endfor %}
</div>
{% endif %}

{% if masters_members.size > 0 %}
## Master's students

<div class="member-grid">
{% for person in masters_members %}
  <article class="member-card">
    {% if person.image %}
      <img class="member-photo" src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    {% endif %}

    <div class="member-info">
      <h3>{{ person.name }}</h3>

      {% if person.role %}
        <p class="member-role">{{ person.role }}</p>
      {% endif %}

      {% if person.themes %}
        <p class="member-tags">{{ person.themes }}</p>
      {% endif %}

      <div class="member-actions">
        {% if person.email %}
          <a href="mailto:{{ person.email }}">Email</a>
        {% endif %}

        {% if person.profile and person.profile != "#" %}
          <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
        {% endif %}
      </div>
    </div>
  </article>
{% endfor %}
</div>
{% endif %}

{% if other_members.size > 0 %}
## Other members

<div class="member-grid">
{% for person in other_members %}
  <article class="member-card">
    {% if person.image %}
      <img class="member-photo" src="{{ site.baseurl }}{{ person.image }}" alt="{{ person.name }}">
    {% endif %}

    <div class="member-info">
      <h3>{{ person.name }}</h3>

      {% if person.role %}
        <p class="member-role">{{ person.role }}</p>
      {% endif %}

      {% if person.themes %}
        <p class="member-tags">{{ person.themes }}</p>
      {% endif %}

      <div class="member-actions">
        {% if person.email %}
          <a href="mailto:{{ person.email }}">Email</a>
        {% endif %}

        {% if person.profile and person.profile != "#" %}
          <a href="{{ person.profile }}" target="_blank" rel="noopener">Profile</a>
        {% endif %}
      </div>
    </div>
  </article>
{% endfor %}
</div>
{% endif %}