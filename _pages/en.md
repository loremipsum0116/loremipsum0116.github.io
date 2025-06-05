---
layout: active
title: "English Section"
permalink: /en/
lang: en
author_profile: true
entries_layout: list
paginate: true
paginate_path: /en/page:num/
---


{% assign filtered_posts = site.posts | where: "lang", "en" %}

{% for post in filtered_posts %}
<article>
  <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
  <p><small>{{ post.date | date: "%B %d, %Y" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}