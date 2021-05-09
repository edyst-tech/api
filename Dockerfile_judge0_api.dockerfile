FROM edyst/judge0-api-base:latest

LABEL maintainer="Abhinandan Panigrahi, abhi@edyst.com" \
    version="1.0.0"

RUN sed -i -e 's|disco|eoan|g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    nodejs \
    npm \
    sudo

RUN echo "gem: --no-document" > /root/.gemrc && \
    gem install \
    bundler \
    pg && \
    /usr/bin/npm install -g npm@latest && \
    sudo /usr/local/bin/npm install -g aglio --unsafe-perm=true --allow-root

EXPOSE 3000

WORKDIR /usr/src/api
COPY Gemfile* /usr/src/api/
RUN RAILS_ENV=production bundle

# Install python dependencies
COPY python_requirements.txt /usr/src/api
RUN pip3 install -r python_requirements.txt

CMD rm -f tmp/pids/server.pid && \
    rails db:create db:migrate db:seed && \
    rails s -b 0.0.0.0

COPY . /usr/src/api
RUN ./scripts/prod-gen-api-docs
