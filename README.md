# Podsmack

## Background and Description

This is a Ruby on Rails application used to organize Podcast content by location and topics of interest. Learning goals from this project were to design and build an application from scratch, consume a JSON API, authenticate users with OAuth, utilize a Sinatra microservice, and configure continuous integration.

<p align="center">
  <a href="https://podsmack.herokuapp.com/">View our Brain Child</a>
 </p>

### Team
<p>
<a href="https://github.com/muydanny">Danny Ramos</a>
</p>
<p>
<a href="https://github.com/takeller">Taylor Keller</a>
</p>
<p>
<a href="https://github.com/kiverso">Kyle Iverson</a>
</p>
<p>
<a href="https://github.com/janegreene">Jane Greene</a>
</p>


## Technologies
* [Listen Notes](https://www.listennotes.com/api/docs/)
* [Sinatra](http://sinatrarb.com/documentation.html)
* [webpacker](https://github.com/rails/webpacker)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [PostgreSQL](https://www.postgresql.org/)
* [TravisCI](https://travis-ci.org/)

### Ruby Version & Gems
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/200px-Ruby_logo.svg.png" alt="Ruby Logo" width="20" height="20"/> v2.5.3
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/200px-Ruby_On_Rails_Logo.svg.png" alt="Rails Logo" width="60" height="20" /> v6.0.3.2

- rspec-rails
- capybara
- launchy
- pry
- simplecov
- shoulda-matchers
- factory_bot_rails
- orderly
- vcr
- webmock
- faker
- rubocop
- figaro

# Getting Started

<p align="center">
 <img src="https://i.imgur.com/d7Ysmwh.png">
</p>

## Installing

#### Clone repository:
```javascript
git clone git@github.com:takeller/podsmack.git
```
#### Install gems:
```javascript
bundle install
```
#### Configure databases:
```javascript
rails db:{create,migrate,seed}
```
#### Fire up local server: (http://localhost:3000)
```javascript
rails s
```
#### Run test suite:
```javascript
bundle exec rspec
```

## User Roles

1. Visitor - this type of user can browse, search, and play podcasts but is unable to follow podcasts.
2. User - this user is registered and logged in to the application via Google Oauth 2.0. They can view all content and follow podcasts of interest. They can also apply to add their own podcast to our site.
3. Admin User - this user can add new podcasts, edit tags, locations and other details.
---

 ### If you are interested in contributing:
- Fork repo (https://github.com/takeller/podsmack)
- Create your feature branch (`git checkout -b feature/fooBar`)
- Commit your changes (`git commit -m 'Add some fooBar'`)
- Push to the branch (`git push origin feature/fooBar`)
- Create a new Pull Request
