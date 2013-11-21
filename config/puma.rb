environment ENV['RACK_ENV']
threads ENV['PUMA_MIN_THREADS'],ENV['PUMA_MAX_THREADS']

workers ENV['PUMA_WORKERS']
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end