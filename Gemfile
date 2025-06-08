# Gemfile

source "https://rubygems.org"

# Specify your Jekyll version
# GitHub Pages uses Jekyll 3.10.0 (as per your log)
# For local development, it's good to match it or use a compatible version.
# If you are having issues, try setting to 3.10.0 or 4.4.1 (which was in your last error message)
gem "jekyll", "~> 4.4" # 또는 "~> 3.10.0"으로 GitHub Pages 버전과 맞출 수도 있습니다. 일단 최신 Stable인 4.4.x로 시도해 봅니다.

# Theme gem
# If you are using remote_theme, you still need to specify the gem for local development.
# Use the version that corresponds to your remote_theme or the latest stable.
# Minimal Mistakes (as per your _config.yml)
gem "minimal-mistakes-jekyll", "~> 4.27" # 현재 사용하고 계신 Minimal Mistakes 버전 (lock 파일에서 확인)

# Jekyll plugins (from your _config.yml)
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-seo-tag", "~> 2.8" # 이전에 에러났던 부분
  gem "jekyll-github-metadata", "~> 2.15"
  # Other plugins that Minimal Mistakes might include or you want to use
  gem "jekyll-gist", "~> 1.5"
  gem "jekyll-include-cache", "~> 0.2"
  gem "jekyll-paginate", "~> 1.1" # 기존 lock 파일에 있었습니다.
end

# Required for Jekyll 4.x on some environments (like Windows)
# WEBrick is a web server that Jekyll 4.x stopped bundling by default.
group :development do
  gem "webrick", "~> 1.7"
end

# Rake is often included for various tasks
gem "rake", ">= 13.0"