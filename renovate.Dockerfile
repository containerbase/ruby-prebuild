#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2023
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=2.7.7

# EOL: 2024
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.0.5

# EOL: 2025
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.1.3
