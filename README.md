# TCPCalc

This is TCPCalc the TCP Server Calculator.

## Usage

    bundle install
    bin/tcpcalc

The default port for tcpcalc is 6789. To run the tcpcalc on a specific port run

    bin/tcpcalc PORT

Where PORT is the port number you want to start the server on.

Once the server is running. You can connect to it with telnet or any other tcp client.

## Protocol

    GET

This command will return your number.

    ADD n

Where n is a number to add to your number. responds with 'ok\n' on success.

    SUBTRACT n

Where n is a number to subtract from your number. response with 'ok\n' on success.

    EXIT

Closes your connection to the server.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/tcpcalc` to start the server.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/srodman7689/tcpcalc.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


