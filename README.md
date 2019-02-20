## Content Api
Ruby Rails application for REST API with ActiveRecord, RSpec, Swagger

### Dependencies:
- Ruby 5.2.2
- PostgreSQL
- Redis

### Installation:
- Clone poject
- Run bundler:

 ```shell
 $ bundle install
 ```
- Create database.yml:
```shell
$ cp config/database.yml.sample config/database.yml
```
- Fill the database:
```shell
 $ bundle exec rake db:seed
```
- Run application:

 ```shell
 $ rails server
 ```
- Run Redis server (in another terminal window):

 ```shell
 $ redis-server
 ```
- Run background engine (in another terminal window):
 
```shell
$ sidekiq
 ```
 
##### Tests:

To execute tests, run following commands:
 
```shell
 $ bundle exec rake db:migrate RAILS_ENV=test #(the first time only)
 $ bundle exec rspec
```
### Swagger Documentation

Enter the root application address in the browser:

```shell
http://localhost:3000/api-docs
```

### License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
