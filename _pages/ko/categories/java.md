---
layout: archive
title: "Java 관련 글"
permalink: /ko/categories/java/
lang: ko
author_profile: true
---

{% assign java_posts = site.categories.java | where: "lang", "ko" %}

<div class="entries-grid">
  {% for post in java_posts %}
    <article class="archive__item">
      {% if post.teaser %}
        <div class="archive__item-teaser">
          <img src="{{ post.teaser | relative_url }}" alt="{{ post.title }}">
        </div>
      {% endif %}
      <h2 class="archive__item-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      <span class="archive__item-date">
        {{ post.date | date: "%Y년 %m월 %d일" }}
      </span>
      {% if post.excerpt %}
        <p class="archive__item-excerpt">{{ post.excerpt | markdownify | strip_html | truncate: 100 }}</p>
      {% endif %}
    </article>
  {% endfor %}
</div>
