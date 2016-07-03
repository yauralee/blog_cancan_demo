# Add cancan for blog
* `gem 'cancancan', '~>1.10'` in Gemfile
* include cancan module into ApplicationController manually:
`  include CanCan::ControllerAdditions` in ApplicationController
* create user model and add user reference to article
* add category and language column to article
* complete validation in User and Article class
* `rake db:migrate`
* `rails g cancan:ability`
* Define abilities in Ability class
* add `load_and_authorize_resource` method for ArticleController and CommentController
* use FactorGirl to create models
* rspec ability
