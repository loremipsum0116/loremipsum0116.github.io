---
layout: home
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
entries_layout: list
paginate: true
paginate_path: /ko/page:num/
---

<ul>
  {% for post in site.posts %}
    {% if post.lang == "ko" %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a><br/>
        <small>{{ post.date | date: "%Y년 %m월 %d일" }}</small><br/>
        {{ post.excerpt }}
      </li>
    {% endif %}
  {% endfor %}
</ul>