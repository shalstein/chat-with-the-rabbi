# Rabbi Appointment Tracker

## Description

A Rails App that allows you to keep track of your appointments with your favorite rabbis. Say goodbye to forgetting about all those appointments.

## Usage

To use this app, clone the repository

```bash
git clone git@github.com:peacestone/chat-with-the-rabbi.git

```

Make sure bundler is installed,

run

```bash
bundle install
```

You will then need to setup and seed the database with

```bash
rails db:create
rails db:migrate
rails db:seed
```

and then to run your server

```bash
rails s
```

You should be able to load the app in your browser at the port specified in the terminal.
Sign in with your Google account, or create account to set up an appointment. To schedule an appointment, you will need to add money to your account by clicking on the link to add money.

## Contributing

Bug reports and pull requests for this project are welcome at its [GitHub page](https://github.com/peacestone/chat-with-the-rabbi). If you choose to contribute, please adhere to the [Ruby Community Conduct Guideline](https://www.ruby-lang.org/en/conduct/). If you'd like to make a suggestion for new features, make them in the "Issues" section and I'll try to get around to implementing them.

## License

This project is open source, under the terms of the [MIT license](https://opensource.org/licenses/MIT).
