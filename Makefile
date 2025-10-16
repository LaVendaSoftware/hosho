setup:
	bin/setup
	make dbreseed dbprepare

start:
	bin/dev

dbreseed:
	bin/rails db:drop db:create db:migrate db:seed RAILS_ENV=development

dbprepare:
	bin/rails db:setup db:test:prepare db:schema:load db:migrate RAILS_ENV=test

ci:
	make brakeman rubocop erb-lint biome dbprepare rspec

rspec:
	bin/rspec

brakeman:
	bin/brakeman

code-fix:
	make rubocop-fix erb-lint-fix biome-fix

rubocop:
	bin/rubocop

rubocop-fix:
	bin/rubocop -A

erb-lint:
	bin/erb_lint app

erb-lint-fix:
	bin/erb_lint app --autocorrect

biome:
	bin/biome

biome-fix:
	bin/biome --write

access-server:
	ssh root@188.245.209.207;

deploy-staging:
	bin/kamal deploy --verbose

release-lock:
	bin/kamal lock release --verbose

logs-staging:
	bin/kamal app logs --verbose --follow

console-staging:
	bin/kamal console --verbose

migrate-staging:
	bin/kamal migrate --verbose
