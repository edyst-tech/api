threads_count = (ENV['RAILS_MAX_THREADS'].presence || '5').to_i
threads threads_count, threads_count
port (ENV['PORT'].presence || '3000')
environment (ENV['RAILS_ENV'].presence || 'development')
workers (ENV.fetch("WEB_CONCURRENCY") { 2 })
preload_app!

plugin :tmp_restart