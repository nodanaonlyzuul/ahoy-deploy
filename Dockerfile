FROM phusion/passenger-ruby25:0.9.32 AS production

# Set correct environment variables.
ENV HOME /root
ENV RACK_ENV production

# Use baseimage-docker's init process.
RUN mkdir -p /etc/my_init.d
CMD ["/sbin/my_init"]

EXPOSE 80
RUN apt-get update
# https://github.com/phusion/passenger-docker/issues/195
RUN apt-get install -y tzdata

# So nginx won't clear the environment variables (see notes in environment-variables.conf)
ADD ./provisioning/docker_build/environment-variables.conf /etc/nginx/main.d/environment-variables.conf

# Passenger Configuration & App
RUN rm /etc/nginx/sites-enabled/default
ADD ./provisioning/docker_build/ahoy-deploy.conf /etc/nginx/sites-enabled/ahoy-deploy.conf
COPY --chown=app:app . /home/app/ahoy-deploy

## Bundle Gems
# https://stackoverflow.com/questions/47972479/after-ruby-update-to-2-5-0-require-bundler-setup-raise-exception
RUN cd /home/app/ahoy-deploy && gem update --system
RUN cd /home/app/ahoy-deploy && bundle install --without test development

# Enables ngnix+passenger
RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM production AS development

run cd /home/app/ahoy-deploy && bundle --with test development
# It will be linked from localhost
run rm -rf /home/app/ahoy-deploy/*
