---
layout: page
title: Research & Publications
permalink: /research/
---

The research group works on statistical and machine learning methods for complex data, with a particular emphasis on time series, spatial and spatio-temporal data, forecasting, nonparametric methods, Bayesian modelling, and interdisciplinary applications.

Our work is often motivated by real-world problems from climate, public health, finance, urban systems, social sciences, policy, and sports. The aim is to develop rigorous methods and apply them to data-rich problems where uncertainty, dependence, heterogeneity, and temporal or spatial structure play an important role.

## Key research themes

<p class="section-note">
Click on a theme to view related publications.
</p>

<div class="theme-grid">
{% for theme in site.data.themes %}
  {% assign theme_papers = site.data.publications | where_exp: "paper", "paper.themes contains theme.id" %}

  <details class="theme-card theme-details" id="{{ theme.id }}">
    <summary class="theme-summary">
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

      <span class="theme-click-label">
        View related publications
      </span>
    </summary>

    {% if theme_papers.size > 0 %}
      <div class="theme-paper-panel">
        {% for paper in theme_papers %}
          <article class="theme-paper-item">
            <p class="theme-paper-title">{{ paper.title }}</p>
            <p class="theme-paper-meta">
              {{ paper.authors }}{% if paper.year %} · {{ paper.year }}{% endif %}
            </p>

            {% if paper.venue %}
              <p class="theme-paper-venue">{{ paper.venue }}</p>
            {% endif %}

            <div class="publication-links theme-paper-links">
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
    {% else %}
      <div class="theme-paper-panel">
        <p class="theme-paper-empty">No publications listed under this theme yet.</p>
      </div>
    {% endif %}
  </details>
{% endfor %}
</div>

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
      {% if paper.status %}
        <span class="publication-status">{{ paper.status }}</span>
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
      {% if paper.status %}
        <span class="publication-status">{{ paper.status }}</span>
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