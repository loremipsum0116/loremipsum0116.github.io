---
layout: archive
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
entries_layout: list
---

{% assign filtered_posts = site.posts | where: "lang", "ko" %}

{% for post in filtered_posts %}
<article>
  <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
  <p><small>{{ post.date | date: "%Y년 %m월 %d일" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
