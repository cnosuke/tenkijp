require "tenkijp/version"
require "tenkijp/client"
require "tenkijp/data"
require 'jisx0402'

module TenkiJp
  class Forecast
    attr_reader :data
    def initialize(location)
      @location = Jisx0402.search(location).first
      @data = Client.get(@location.code[0..-2].to_i)
    end

    def to_s
      return <<EOB
■ #{@location.full}の天気
#{week.to_s}

#{two_days.map(&:index).join("\n")}
EOB
    end

    def two_days
      @data['days']['entries'].map do |day|
        Data::Day.new(day)
      end
    end

    def week
      Data::Week.new(@data['days']['entries'], @data['tenweek']['entries'])
    end
  end
end
