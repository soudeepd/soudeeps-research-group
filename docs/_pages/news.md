---
layout: page
title: News 
permalink: /news/
---

This page records selected news, academic activities, group updates, talks, publications, and other events connected with The SIGNAL Group.

<div class="research-page-nav">
  <a href="#latest">Latest</a>
  <a href="#announcements">Announcements</a>
  <a href="#talks">Talks</a>
  <a href="#activities">Group activities</a>
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

<h2 id="announcements">Announcements</h2>

<div class="news-timeline">
{% assign announcements = site.data.news | where: "type", "announcement" | sort: "date" | reverse %}
{% for item in announcements %}
  {% include news-timeline-item.html item=item %}
{% endfor %}
</div>

<h2 id="talks">Talks and seminars</h2>

<div class="news-timeline">
{% assign talks = site.data.news | where: "type", "talk" | sort: "date" | reverse %}
{% for item in talks %}
  {% include news-timeline-item.html item=item %}
{% endfor %}
</div>

<h2 id="activities">Group activities</h2>

<div class="news-timeline">
{% assign activities = site.data.news | where: "type", "activity" | sort: "date" | reverse %}
{% for item in activities %}
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