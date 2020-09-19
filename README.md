# README

To run the tests, first seed the test db with

```
RAILS_ENV=test bundle exec rake db:test:prepare
RAILS_ENV=test bundle exec rake db:seed
```

Then you can run

`rails test`
