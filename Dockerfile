FROM jekyll/builder:latest

# Install some jekyll plugins
RUN apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
    && apk add --no-cache \
        python \
    && gem install \
        jekyll-sitemap \
        jekyll-last-modified-at \
        rake \
        html-proofer \

# Clean
    && apk del -f .build-deps \
    && docker-helper cleanup

VOLUME /src
EXPOSE 4000

WORKDIR /src
