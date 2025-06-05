---
layout: default
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
---

{% assign ko_posts = site.posts | where: "lang", "ko" %}
{% assign pinned = ko_posts | where: "pinned", true %}
{% assign recent = ko_posts | where_exp: "post", "post.pinned != true" | sort: "date" | reverse | slice: 0, 5 %}

{%- if pinned.size > 0 %}
## 📌 고정 글
{% for post in pinned %}
<article>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p><small>{{ post.date | date: "%Y년 %m월 %d일" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
{%- endif %}

---

## 📝 최근 게시글 (5개)

{% for post in recent %}
<article>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p><small>{{ post.date | date: "%Y년 %m월 %d일" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
