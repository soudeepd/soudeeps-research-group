---
layout: page
title: Resources
permalink: /resources/
---

This page collects books, seminar slides, study materials, and other academic resources created or authored by members of The SIGNAL Group.

<div class="research-page-nav">
  <a href="#books">Books</a>
  <a href="#seminar-slides">Seminar slides</a>
  <a href="#study-materials">Study materials</a>
  <a href="#others">Others</a>
</div>

<h2 id="books">Books</h2>

<div class="resource-book-grid">
{% assign books = site.data.resources | where: "category", "books" %}
{% for item in books %}
  <article class="resource-book-card">
    {% if item.image %}
      <img class="resource-book-cover" src="{{ site.baseurl }}{{ item.image }}" alt="{{ item.title }}">
    {% endif %}

    <div class="resource-book-info">
      <h3>{{ item.title }}</h3>

      {% if item.authors %}
        <p class="resource-meta">{{ item.authors }}</p>
      {% endif %}

      {% if item.description %}
        <p>{{ item.description }}</p>
      {% endif %}

      <div class="resource-links">
        {% for link in item.links %}
          <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
        {% endfor %}
      </div>
    </div>
  </article>
{% endfor %}
</div>

<h2 id="seminar-slides">Seminar slides</h2>

<div class="seminar-slide-list">
{% assign slides = site.data.resources | where: "category", "seminar-slides" %}
{% for item in slides %}
  <article class="seminar-slide-item">
    <div class="seminar-slide-title-row">
      <p class="seminar-slide-title">{{ item.title }}</p>

      {% if item.links %}
        <div class="seminar-slide-links">
          {% for link in item.links %}
            {% assign first_char = link.url | slice: 0 %}
            {% if first_char == "/" %}
              <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">Download slides</a>
            {% else %}
              <a href="{{ link.url }}" target="_blank" rel="noopener">Download slides</a>
            {% endif %}
          {% endfor %}
        </div>
      {% endif %}
    </div>

    <p class="seminar-slide-meta">
      {% if item.presenter %}
        {{ item.presenter }}
      {% elsif item.authors %}
        {{ item.authors }}
      {% endif %}

      {% if item.event %}
        · {{ item.event }}
      {% elsif item.conference %}
        · {{ item.conference }}
      {% endif %}

      {% if item.year %}
        · {{ item.year }}
      {% endif %}
    </p>
  </article>
{% endfor %}
</div>

<h2 id="study-materials">Study materials</h2>

<div class="study-material-list">
{% assign study_materials = site.data.resources | where: "category", "study-materials" %}
{% for item in study_materials %}
  <article class="study-material-item">
    <div class="study-material-title-row">
      <p class="study-material-title">{{ item.title }}</p>

      {% if item.links %}
        <div class="study-material-links">
          {% for link in item.links %}
            {% assign first_char = link.url | slice: 0 %}
            {% if first_char == "/" %}
              <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
            {% else %}
              <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
            {% endif %}
          {% endfor %}
        </div>
      {% endif %}
    </div>

    {% if item.description %}
      <p class="study-material-description">{{ item.description }}</p>
    {% endif %}
  </article>
{% endfor %}
</div>

<h2 id="others">Others</h2>

<ul class="resource-list">
{% assign others = site.data.resources | where: "category", "others" %}
{% for item in others %}
  <li>
    <strong>{{ item.title }}</strong>
    {% if item.authors %}<br>{{ item.authors }}{% endif %}
    {% if item.description %}<br>{{ item.description }}{% endif %}
    {% if item.links %}
      <br>
      {% for link in item.links %}
        {% assign first_char = link.url | slice: 0 %}
        {% if first_char == "/" %}
          <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>{% unless forloop.last %} · {% endunless %}
        {% else %}
          <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>{% unless forloop.last %} · {% endunless %}
        {% endif %}
      {% endfor %}
    {% endif %}
  </li>
{% endfor %}
</ul>