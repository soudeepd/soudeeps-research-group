---
layout: page
title: Research & Publications
permalink: /research/
---

The research group works on statistical and machine learning methods for complex data, with a particular emphasis on time series, spatial and spatio-temporal data, forecasting, nonparametric methods, Bayesian modelling, and interdisciplinary applications.

Our work is often motivated by real-world problems from climate, public health, finance, urban systems, social sciences, policy, and sports. The aim is to develop rigorous methods and apply them to data-rich problems where uncertainty, dependence, heterogeneity, and temporal or spatial structure play an important role.

## Key research themes

<div class="theme-grid">
{% for theme in site.data.themes %}
  <section class="theme-card" id="{{ theme.id }}">
    <div class="theme-icon">{{ theme.icon }}</div>
    <h3>{{ theme.name }}</h3>
    <p>{{ theme.description }}</p>

    {% if theme.keywords %}
      <div class="theme-keywords">
      {% for keyword in theme.keywords %}
        <span>{{ keyword }}</span>
      {% endfor %}
      </div>
    {% endif %}

    <p class="theme-link">
      <a href="#pubs-{{ theme.id }}">View related publications</a>
    </p>
  </section>
{% endfor %}
</div>

## Publications by theme

{% for theme in site.data.themes %}
  {% assign theme_papers = site.data.publications | where_exp: "paper", "paper.themes contains theme.id" %}

  {% if theme_papers.size > 0 %}
  <section class="theme-publication-section" id="pubs-{{ theme.id }}">
    <h3>{{ theme.name }}</h3>

    <div class="publication-compact-list">
    {% for paper in theme_papers %}
      <article class="publication-item">
        <div class="publication-main">
          <p class="publication-title">{{ paper.title }}</p>
          <p class="publication-meta">{{ paper.authors }}{% if paper.year %} · {{ paper.year }}{% endif %}</p>
          {% if paper.venue %}
            <p class="publication-venue">{{ paper.venue }}</p>
          {% endif %}
        </div>

        <div class="publication-links">
          {% for link in paper.links %}
            {% assign first_char = link.url | slice: 0 %}
            {% if first_char == "/" %}
              <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
            {% else %}
              <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
            {% endif %}
          {% endfor %}
        </div>
      </article>
    {% endfor %}
    </div>
  </section>
  {% endif %}
{% endfor %}

## Pre-prints and working papers

{% assign preprints = site.data.publications | where: "type", "preprint" %}

<div class="publication-compact-list">
{% for paper in preprints %}
  <article class="publication-item">
    <div class="publication-main">
      <p class="publication-title">{{ paper.title }}</p>
      <p class="publication-meta">{{ paper.authors }}{% if paper.year %} · {{ paper.year }}{% endif %}</p>
      {% if paper.venue %}
        <p class="publication-venue">{{ paper.venue }}</p>
      {% endif %}
    </div>

    <div class="publication-links">
      {% for link in paper.links %}
        {% assign first_char = link.url | slice: 0 %}
        {% if first_char == "/" %}
          <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
        {% else %}
          <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
        {% endif %}
      {% endfor %}
    </div>
  </article>
{% endfor %}
</div>

## Accepted publications since 2020

{% assign accepted = site.data.publications | where: "type", "publication" %}

<div class="publication-compact-list">
{% for paper in accepted %}
  <article class="publication-item">
    <div class="publication-main">
      <p class="publication-title">{{ paper.title }}</p>
      <p class="publication-meta">{{ paper.authors }}{% if paper.year %} · {{ paper.year }}{% endif %}</p>
      {% if paper.venue %}
        <p class="publication-venue">{{ paper.venue }}</p>
      {% endif %}
    </div>

    <div class="publication-links">
      {% for link in paper.links %}
        {% assign first_char = link.url | slice: 0 %}
        {% if first_char == "/" %}
          <a href="{{ site.baseurl }}{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
        {% else %}
          <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.label }}</a>
        {% endif %}
      {% endfor %}
    </div>
  </article>
{% endfor %}
</div>