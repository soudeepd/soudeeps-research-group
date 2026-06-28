---
layout: page
title: Members
permalink: /members/
---

Following are the current members of SIGNAL Lab, who are working in different capacities.

{% assign pi_members = site.data.members | where: "category", "pi" %}
{% assign phd_members = site.data.members | where: "category", "phd" %}
{% assign postdoc_members = site.data.members | where: "category", "postdoc" %}
{% assign masters_members = site.data.members | where: "category", "masters" %}
{% assign other_members = site.data.members | where: "category", "other" %}

{% if pi_members.size > 0 %}
<section class="member-section">
  <h2>Principal Investigator</h2>

  <div class="member-grid pi-grid">
  {% for person in pi_members %}
    <article class="member-card pi-card" id="{{ person.id }}">
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
</section>
{% endif %}

{% if postdoc_members.size > 0 %}
<section class="member-section">
  <h2>Postdoctoral fellows</h2>

  <div class="member-grid">
  {% for person in postdoc_members %}
    <article class="member-card" id="{{ person.id }}">
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
        <div class="member-main-links">
          {% if person.email %}
              <a href="mailto:{{ person.email }}">Email</a>
          {% endif %}

          {% if person.webpage %}
              <a href="{{ person.webpage }}" target="_blank" rel="noopener">Website</a>
          {% endif %}
        </div>

        <div class="member-publication-link">
            <a href="#pubs-{{ person.id }}">SIGNAL Lab publications</a>
        </div>
        </div>
        
      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}


{% if phd_members.size > 0 %}
<section class="member-section">
  <h2>PhD students</h2>

  <div class="member-grid">
  {% for person in phd_members %}
    <article class="member-card" id="{{ person.id }}">
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
        <div class="member-main-links">
          {% if person.email %}
              <a href="mailto:{{ person.email }}">Email</a>
          {% endif %}

          {% if person.webpage %}
              <a href="{{ person.webpage }}" target="_blank" rel="noopener">Website</a>
          {% endif %}
        </div>

        <div class="member-publication-link">
            <a href="#pubs-{{ person.id }}">SIGNAL Lab publications</a>
        </div>
        </div>

      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}

{% if masters_members.size > 0 %}
<section class="member-section">
  <h2>Master's students</h2>

  <div class="member-grid">
  {% for person in masters_members %}
   <article class="member-card" id="{{ person.id }}">
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
        <div class="member-main-links">
          {% if person.email %}
              <a href="mailto:{{ person.email }}">Email</a>
          {% endif %}

          {% if person.webpage %}
              <a href="{{ person.webpage }}" target="_blank" rel="noopener">Website</a>
          {% endif %}
        </div>

        <div class="member-publication-link">
            <a href="#pubs-{{ person.id }}">SIGNAL Lab publications</a>
        </div>
        </div>

      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}

{% if other_members.size > 0 %}
<section class="member-section">
  <h2>Other members</h2>

  <div class="member-grid">
  {% for person in other_members %}
    <article class="member-card" id="{{ person.id }}">
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
        <div class="member-main-links">
          {% if person.email %}
              <a href="mailto:{{ person.email }}">Email</a>
          {% endif %}

          {% if person.webpage %}
              <a href="{{ person.webpage }}" target="_blank" rel="noopener">Website</a>
          {% endif %}
        </div>

        <div class="member-publication-link">
            <a href="#pubs-{{ person.id }}">SIGNAL Lab publications</a>
        </div>
        </div>

      </div>
    </article>
  {% endfor %}
  </div>
</section>
{% endif %}
