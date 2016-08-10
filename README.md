# JSON log formatter for Rails

A really simple log formatter for Rails applications.

## Usage

In 'config/application.rb' add:

```ruby
config.log_formatter = JsonLogFormatter.new
```