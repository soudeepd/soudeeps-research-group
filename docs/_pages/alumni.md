---
layout: page
title: Alumni
permalink: /alumni/
---

This page lists former doctoral students, postdoctoral fellows, and other research associates who have worked in this group and have coauthored at least one research paper or case study.

The alumni directory is intended to document the academic and professional journeys of people associated with the SIGNAL Lab and to help future students, collaborators, and alumni understand the range of research areas connected with the group.

If you are an alumnus of this group and want your information to be added/modified, please send an email to [soudeeps.research.group@gmail.com](mailto:soudeeps.research.group@gmail.com).

{% assign phd_alumni = site.data.alumni | where: "category", "phd" %}
{% assign postdoc_alumni = site.data.alumni | where: "category", "postdoc" %}
{% assign other_alumni = site.data.alumni | where: "category", "other" %}

{% if phd_alumni.size > 0 %}
<section class="member-section">
  <h2>PhD students</h2>

  <div class="member-grid">
  {% for person in phd_alumni %}
    <article class="member-card"  id="{{ person.id }}">
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
  	<p class="member-current"><span class="mini-label">Current</span> {{ person.current }}</p>
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
</section>
{% endif %}

{% if postdoc_alumni.size > 0 %}
<section class="member-section">
  <h2>Postdoctoral fellows</h2>

  <div class="member-grid">
  {% for person in postdoc_alumni %}
    <article class="member-card"  id="{{ person.id }}">
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
  	<p class="member-current"><span class="mini-label">Current</span> {{ person.current }}</p>
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
</section>
{% endif %}

{% if other_alumni.size > 0 %}
<section class="member-section">
  <h2>Key research fellows</h2>

  <div class="member-grid">
  {% for person in other_alumni %}
    <article class="member-card"  id="{{ person.id }}">
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
  	<p class="member-current"><span class="mini-label">Current</span> {{ person.current }}</p>
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
</section>
{% endif %}


## Other notable research assistants

- Mareeswaran M: Former PhD student in the Finance & Accounting area at Indian Institute of Management Bangalore. Later joined Queens Business School, Gift City, as a faculty.
- Meghana Krishna: Worked during 2024-25 as a research assistant.
- Sreeranjini TM: Worked during 2023-25, later joined doctoral program at Indian Institute of Technology Bombay.
- Anagh Chattopadhyay: Worked during 2021-23, later joined doctoral program at Johns Hopkins University.
- Manit Paul: Worked during 2021-22, later joined doctoral program at University of Pennsylvania.
- Anirban Nath: Worked during 2021-22, later joined doctoral program at Columbia University.
- Shubhajit Sen: Worked during 2020-23, later joined doctoral program at North Carolina State University.
- Divya Chakarwarti: Worked during 2021-22, later joined Google as Software Engineer.
- Siddhant Nahata: Worked during 2020-21, later joined McKinsey & Co as Business Analyst.



