web: bundle exec rails server -p $PORT
web: bundle exec puma -p $PORT -c ./config/puma.rb
redis: redis-server
sidekiq: bundle exec sidekiq -e production -c 5
