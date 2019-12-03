FROM jekyll/builder:latest

ENV BUNDLE_HOME=/usr/local/bundle

# Install some jekyll plugins
RUN gem install --install-dir $BUNDLE_HOME \
        jekyll-sitemap \
        jekyll-last-modified-at \
        rake \
        html-proofer

# Assign ownership to user jekyll:jekyll
RUN chown -R jekyll:jekyll $BUNDLE_HOME

# Remove the bundle cache
RUN rm -rf $BUNDLE_HOME/cache

EXPOSE 4000