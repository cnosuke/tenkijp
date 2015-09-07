module TenkiJp
  class Data

    class Week
      def initialize(data)
        @d = data
      end

      def to_s
        str = "   日付   |   天気   | 降水 | 最低 | 最高\n"
        str << '-' * 41 + "\n"
        @d.map { |d|
          str << <<EOB
#{d['dt']}(#{d['dy']}) | #{wh(d['wh'])} |  #{d['p_day']}% |  #{d['max_t']} |  #{d['min_t']}
EOB
        }
        str
      end

      def wh(str)
        w = {
          week_01: '晴',
          week_02: '晴時々曇', #?
          week_03: '晴時々雨',
          week_05: '晴→曇',
          week_06: '晴→雨',

          week_08: '曇',
          week_09: '曇時々晴',
          week_10: '曇時々雨',

          week_15: '雨',
          week_16: '雨時々晴',
          week_17: '雨時々曇',
          week_19: '雨→晴',
          week_20: '雨→曇',
        }[str.to_sym] || str
        w + (4-w.size).times.map{'　'}.join
      end
    end

    class Day
      MEMBERS = {
        index_str:  '概要',
        p_day:  '降水確率',
        dt:  '日付',
        wt:  '天気',
        max_t_d:  '最高気温前日比',
        p_am_str:  '午前降水確率',
        p_am:  '午前降水確率',
        p_pm_str:  '午後降水確率',
        p_pm:  '午後降水確率',
        min_t:  '最低気温',
        wh:  '天気',
        max_t:  '最高気温',
        dy:  '曜日',
        min_t_d:  '最低気温前日比',
        s24:  '',
        p_zero:  '降水確率0時',
        p_six:  '降水確率06時',
        p_twelve:  '降水確率12時',
        p_eighteen:  '降水確率18時',
        ds:  '日付呼称',
        uv:  '紫外線',
      }
      def initialize(data)
        @d = data
      end

      def to_s
        return <<EOB
■ #{@d['ds']} #{@d['dt']}(#{@d['dy']}) 「#{@d['wt']}」 降水確率: #{@d['p_day']}%
#{@d['index_str']}
[気温] 最低: #{@d['min_t']} (#{@d['min_t_d']}), 最高: #{@d['max_t']} (#{@d['max_t_d']})
[降水確率] 0時: #{@d['p_zero']}%, 6時: #{@d['p_six']}%, 12時: #{@d['p_twelve']}%, 18時: #{@d['p_eighteen']}%
EOB
      end
    end
  end
end
