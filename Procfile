release: bundle exec rails db:migrate
web: bundle exes puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}