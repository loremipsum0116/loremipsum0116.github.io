---
layout: paginate-category
title: "Java 관련 글"
permalink: /ko/categories/java/
pagination:
  enabled: true
  category: java
  locale: ko
lang: ko
author_profile: true
---

<div class="entries-grid">
  {% for post in paginator.posts %}
    <article class="archive__item">
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

{% include pagination.html %}
