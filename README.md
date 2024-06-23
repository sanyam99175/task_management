# Task Management App

## Setup

1. Clone the repository.
2. Install dependencies: `bundle install`
3. Set up the database: `rails db:create db:migrate`
4. Start the server: `rails server`

## Features

- User authentication
- Create, update, and delete tasks
- Task states: Backlog, In-progress, Done
- Email alerts for approaching deadlines

## Testing

To run tests, use:
    bundle exec rspec

## Process & Structure

1. After Basic setup, perform devise setup for user authentication.
    - gem 'devise' in Gemfile & bundle install
    - rails g devise:install
    - rails g devise:user

2. Generate basic structure for task ( model, controller, views, routes & other necessary files)
    - rails g scaffold Task title description:text status deadline:datetime user:references
    - rails db:migrate ( for task table creation )

3. Implement CRUD operations on tasks making necessary changes to controller/model as per requirements.

4. Include Bootstrap CSS & JS links & scripts to use bootstrap cards, forms & buttons for better UI.

5. Create a TaskMailer that will be used to send mails as per deadline.
    - rails generate mailer TaskMailer
    - Add relavant changes to TaskMailer ( email , subject)
    - Create a template for mail to be sent
    - Configure mail settings ( SMTP )
    - Create a scheduler using rufus-scheduler that will trigger TaskMailer based on deadline.

6. Create Test cases using FactoryBot, rspec & capybara
    - Include both gems in Gemfile & run bundle install
    - Create Factory models for users & tasks assigning default value
    - Create tests for features like user signup/signin/signout & tasks CRUD.
    - Execute test cases using bundle exec rspec
