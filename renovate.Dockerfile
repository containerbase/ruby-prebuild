#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2027-03-31 (expected)
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.3.11

# EOL: TBD
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.4.9

# EOL: TBD
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=4.0.0
