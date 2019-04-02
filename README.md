# CasSeas3RailsResponders
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cas_seas3_rails_responders'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cas_seas3_rails_responders
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Local Installation

cas_seas3_rails_responders on master via ruby v2.5.1
➜ ls
Gemfile                            Rakefile                           spec
Gemfile.lock                       bin                                test
MIT-LICENSE                        cas_seas3_rails_responders.gemspec
README.md                          lib

cas_seas3_rails_responders on master via ruby v2.5.1
➜ gem build cas_seas3_rails_responders.gemspec
WARNING:  open-ended dependency on sqlite3 (>= 0, development) is not recommended
  use a bounded requirement, such as '~> x.y'
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
  Successfully built RubyGem
  Name: cas_seas3_rails_responders
  Version: 0.1.0
  File: cas_seas3_rails_responders-0.1.0.gem

cas_seas3_rails_responders on master [?] via ruby v2.5.1
➜ gem install cas_seas3_rails_responders-0.1.0.gem
Successfully installed cas_seas3_rails_responders-0.1.0
Parsing documentation for cas_seas3_rails_responders-0.1.0
Installing ri documentation for cas_seas3_rails_responders-0.1.0
Done installing documentation for cas_seas3_rails_responders after 0 seconds
1 gem installed

---
```cas_seas3_rails_responders on master [!] via ruby v2.5.1
➜ gem build cas_seas3_rails_responders.gemspec
WARNING:  open-ended dependency on sqlite3 (>= 0, development) is not recommended
  use a bounded requirement, such as '~> x.y'
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
  Successfully built RubyGem
  Name: cas_seas3_rails_responders
  Version: 0.1.0
  File: cas_seas3_rails_responders-0.1.0.gem

cas_seas3_rails_responders on master [!?] via ruby v2.5.1
➜ gem install cas_seas3_rails_responders-0.1.0.gem
Successfully installed cas_seas3_rails_responders-0.1.0
Parsing documentation for cas_seas3_rails_responders-0.1.0
Installing ri documentation for cas_seas3_rails_responders-0.1.0
Done installing documentation for cas_seas3_rails_responders after 0 seconds
1 gem installed

cas_seas3_rails_responders on master [!?] via ruby v2.5.1 took 4s
➜ irb
irb(main):001:0> require 'cas_seas3_rails_responders'
=> true```
---

## Testing in dev

At command line:

irb -I lib

In console:
require "cas_seas3_rails_responders"

If that runs without errors then generally this indicates goodness and joy.

## Other

Initial rails new statement:

rails plugin new cas_seas3_rails_responders2