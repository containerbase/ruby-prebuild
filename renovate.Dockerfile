#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2024
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.0.6

# EOL: 2025
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.1.4

# EOL: 2026
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.2.2
