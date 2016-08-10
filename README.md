# JSON log formatter for Rails

A really simple log formatter for Rails applications.

## Installation

Add the following to your Gemfile

```
gem 'json_log_formatter', github: 'aggronerd/json_log_formatter'
```

## Usage

At the top of 'config/application.rb' add:

```ruby
require 'json_log_formatter'
```

And further in the file in the configuration block add:

```ruby
config.log_formatter = JsonLogFormatter.new
```