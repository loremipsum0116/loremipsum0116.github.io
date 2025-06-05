---
layout: archive
title: "日本語セクション"
permalink: /ja/
lang: ja
author_profile: true
---

## **ロレム技術ブログへようこそ**

**ロレム技術ブログ**の日本語セクションへようこそ。  
ここでは **Java**, **Spring**, **JPA** などに関する記事を日本語でお届けします。

---

## 🆕 最新記事

{% assign lang_posts = site.posts | where: "lang", "ja" | slice: 0, 5 %}
{% for post in lang_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}
