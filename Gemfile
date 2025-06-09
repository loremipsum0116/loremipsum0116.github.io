# Gemfile

source "https://rubygems.org"

# Jekyll core
gem "jekyll", "~> 4.4" # 또는 "~> 3.10.0"으로 GitHub Pages 버전과 맞출 수도 있음

# Minimal Mistakes 테마 (필수)
gem "minimal-mistakes-jekyll", "~> 4.27"

# Jekyll 플러그인들
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-github-metadata", "~> 2.15"
  gem "jekyll-gist", "~> 1.5"
  gem "jekyll-include-cache", "~> 0.2"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-archives", "~> 2.2"

  # ✅ 여기에 추가 (제일 아래)
  gem "jekyll-paginate-v2"
end

# 개발 환경을 위한 추가 패키지
group :development do
  gem "webrick", "~> 1.7"
end

# 작업용 유틸리티
gem "rake", ">= 13.0"
