---
layout: page
title: News 
permalink: /news/
---

This page records selected news, academic activities, group updates, talks, publications, and other events connected with The SIGNAL Group.

<div class="research-page-nav">
  <a href="#latest">Latest</a>
  <a href="#research-updates">Research updates</a>
  <a href="#achievements">Achievements</a>
  <a href="#group-updates">Group updates</a>
  <a href="#archive">Archive</a>
</div>

<h2 id="latest">Latest updates</h2>

<div class="news-feature-grid">
{% assign latest_news = site.data.news | sort: "date" | reverse %}
{% for item in latest_news limit: 3 %}
  <article class="news-feature-card">
    {% if item.image %}
      <img src="{{ site.baseurl }}{{ item.image }}" alt="{{ item.title }}">
    {% endif %}

    <div class="news-feature-body">
      {% if item.category %}
        <span class="news-category">{{ item.category }}</span>
      {% endif %}

      <h3>{{ item.title }}</h3>

      {% if item.date %}
        <p class="news-date">{{ item.date | date: "%B %-d, %Y" }}</p>
      {% endif %}

      {% if item.description %}
        <p>{{ item.description }}</p>
      {% endif %}

      {% if item.links %}
        <div class="news-links">
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
  </article>
{% endfor %}
</div>

<h2 id="research-updates">Research updates</h2>

<div class="news-timeline">
{% assign research_updates = site.data.news | where: "type", "research-update" | sort: "date" | reverse %}
{% for item in research_updates %}
  {% include news-timeline-item.html item=item %}
{% endfor %}
</div>

<h2 id="achievements">Achievements</h2>

<div class="news-timeline">
{% assign achievements = site.data.news | where: "type", "achievement" | sort: "date" | reverse %}
{% for item in achievements %}
  {% include news-timeline-item.html item=item %}
{% endfor %}
</div>

<h2 id="group-updates">Group updates</h2>

<div class="news-timeline">
{% assign group_updates = site.data.news | where: "type", "group-update" | sort: "date" | reverse %}
{% for item in group_updates %}
  {% include news-timeline-item.html item=item %}
{% endfor %}
</div>

<h2 id="archive">Archive</h2>

<div class="news-archive-list">
{% assign all_news = site.data.news | sort: "date" | reverse %}
{% for item in all_news %}
  <article class="news-archive-item">
    <span class="news-archive-date">{{ item.date | date: "%b %Y" }}</span>
    <span class="news-archive-title">{{ item.title }}</span>
    {% if item.category %}
      <span class="news-archive-category">{{ item.category }}</span>
    {% endif %}
  </article>
{% endfor %}
</div>