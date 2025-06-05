---
layout: home
title: "English Section"
permalink: /en/
lang: en
author_profile: true
entries_layout: list
paginate: true
paginate_path: /en/page:num/
---


<ul>
  {% for post in site.posts %}
    {% if post.lang == "en" %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a><br/>
        <small>{{ post.date | date: "%B %d, %Y" }}</small><br/>
        {{ post.excerpt }}
      </li>
    {% endif %}
  {% endfor %}
</ul>