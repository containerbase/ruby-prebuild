#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2025-03-31
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.1.7

# EOL: 2026-03-31
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.2.8

# EOL: 2027-03-31
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.3.7

# EOL: TBD
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.4.2
