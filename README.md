# Dependencyswapper

Dependencyswapper also known as `depswapper` is a CocoaPods plugin that allows to switch between "dev/test/prod" environments with just running a simple ruby command.

As a watchOS, tvOS and iOS Framework developer I often find myself wanting to debug my non source Frameworks to make sure the problem is not in my dependent Application/Framework. It is always time consuming to have to find the `Podfile`, then look for the git repository of the Framework I want to debug and then google the syntax to read from a git repository. With `depswapper` you will be able to change between source/non source pods with just one command in the terminal.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dependencyswapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dependencyswapper

## Usage


Whenever you want to swap environments on any of your dependencies, run `depswapper test "NameOfYourFramework"` or `depswapper dev "NameOfYourFramework"` at the root of your Project. 
- The `dev` subcommand will clone the git repository for the pod and point to it locally.
- The `test` subcommand will pull the pod directly from the git repository and pull it as source.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pkrmf/dependencyswapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dependencyswapper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dependencyswapper/blob/master/CODE_OF_CONDUCT.md).
