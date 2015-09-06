# TenkiJp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tenkijp`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tenkijp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tenkijp

## Usage

```ruby
2.2.2-p95(main)> require 'tenkijp'
2.2.2-p95(main)> puts TenkiJp::Forecast.new('しぶや').to_s
東京都渋谷区の天気
■ 今日 09/07(月) 「曇一時雨」 降水確率: 60%
日焼け対策をして、紫外線をガード
[気温] 最低: 23° (+1), 最高: 28° (+1)
[降水確率] 0時: 60%, 6時: 40%, 12時: 20%, 18時: 20%

■ 明日 09/08(火) 「雨時々曇」 降水確率: 70%
ジワーっと暑いです。不快に感じる暑さ
[気温] 最低: 23° (0), 最高: 25° (-3)
[降水確率] 0時: 40%, 6時: 50%, 12時: 60%, 18時: 70%


   日付   |   天気   | 降水 | 最低 | 最高
-----------------------------------------
09/09(水) | 雨　　　 |  60% |  24° |  21°
09/10(木) | 曇時々雨 |  60% |  25° |  20°
09/11(金) | 曇　　　 |  40% |  26° |  19°
09/12(土) | 曇時々晴 |  20% |  28° |  20°
09/13(日) | 曇時々晴 |  40% |  28° |  21°
09/14(月) | 晴→雨　 |  60% |  28° |  23°
09/15(火) | 雨時々曇 |  80% |  28° |  23°
09/16(水) | ---　 |  ---% |  --- |  ---
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tenkijp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
