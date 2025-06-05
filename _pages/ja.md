---
layout: default
title: "日本語セクション"
permalink: /ja/
lang: ja
author_profile: true
entries_layout: list
paginate: true
paginate_path: /ja/page:num/
---

## 最近の投稿

<ul>
  {% for post in site.posts %}
    {% if post.lang == "ja" %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a><br/>
        <small>{{ post.date | date: "%Y年%m月%d日" }}</small><br/>
        {{ post.excerpt }}
      </li>
    {% endif %}
  {% endfor %}
</ul>