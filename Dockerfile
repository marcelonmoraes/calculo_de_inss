FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    postgresql-client

# Install Yarn
RUN npm install -g yarn

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy package.json and yarn.lock (if exists)
COPY package.json yarn.lock* ./

# Install Node.js dependencies
RUN yarn install

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Build assets
RUN yarn build
RUN yarn build:css

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"] 