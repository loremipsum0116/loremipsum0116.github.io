---
layout: active
title: "日本語セクション"
permalink: /ja/
lang: ja
author_profile: true
entries_layout: list
paginate: true
paginate_path: /ja/page:num/
---


{% assign filtered_posts = site.posts | where: "lang", "ja" %}

{% for post in filtered_posts %}
<article>
  <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
  <p><small>{{ post.date | date: "%Y年%m月%d日" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}