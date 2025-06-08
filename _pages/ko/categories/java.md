---
layout: default
title: "Java 관련 글"
permalink: /ko/categories/java/
lang: ko
---

<h1>Java 관련 글</h1>

<ul>
  {% for post in site.posts %}
    {% if post.lang == "ko" and post.categories contains "java" %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
        <span> - {{ post.date | date: "%Y-%m-%d" }}</span>
      </li>
    {% endif %}
  {% endfor %}
</ul>
