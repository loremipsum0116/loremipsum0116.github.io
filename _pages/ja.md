---
layout: default
title: "日本語セクション"
permalink: /ja/
lang: ja
author_profile: true
---

{% assign ja_posts = site.posts | where: "lang", "ja" %}
{% assign pinned = ja_posts | where: "pinned", true %}
{% assign recent = ja_posts | where_exp: "post", "post.pinned != true" | sort: "date" | reverse | slice: 0, 5 %}

{%- if pinned.size > 0 %}
  <h2>📌 固定ポスト</h2>
  {% for post in pinned %}
  <article>
    <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
    <p><small>{{ post.date | date: "%Y年 %m月 %d日" }}</small></p>
    {{ post.excerpt }}
  </article>
  {% endfor %}
{%- endif %}

<hr />

<h2>📝 最新の投稿（5件）</h2>
{% for post in recent %}
<article>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p><small>{{ post.date | date: "%Y年 %m月 %d日" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
