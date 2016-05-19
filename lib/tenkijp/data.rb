module TenkiJp
  class Data

    class Week
      def initialize(days, tenweek)
        @days    = days
        @tenweek = tenweek
      end

      def to_s
        str = "     日付      |     天気     | 最低 | 最高 | 降水 (0時, 6時, 12時, 18時)\n"
        str << '-' * 74 + "\n"
        @days.each { |d| str << Day.new(d).to_s }
        @tenweek.each { |d|
          str << <<EOB
#{d['dt']}(#{d['dy']}) | #{wh(d['wh'])} |  #{d['min_t']}  |  #{d['max_t']}  |  #{"%2s" % d['p_day']}%
EOB
        }
        str
      end

      def wh(str)
        w = {
          week_01: '晴',
          week_02: '晴時々曇',
          week_03: '晴一時雨',
          week_04: '晴一時雪',
          week_05: '晴→曇',
          week_06: '晴→雨',
          week_07: '晴→雪',

          week_08: '曇',
          week_09: '曇時々晴',
          week_10: '曇一時雨',
          week_11: '曇一時雪',
          week_12: '曇→晴',
          week_13: '曇→雨',
          week_14: '曇→雪',

          week_15: '雨',
          week_16: '雨時々晴',
          week_17: '雨時々曇',
          week_18: '雨時々雪',
          week_19: '雨→晴',
          week_20: '雨→曇',
          week_21: '雨→雪',
          week_22: '暴風雨?',

          week_23: '雪',
          week_24: '雪時々晴',
          week_25: '雪時々曇',
          week_26: '雪時々雨',
          week_27: '雪→晴',
          week_28: '雪→曇',
          week_29: '雪→雨',
          week_30: '大雪?',
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
        w = <<EOB
#{@d['dt']}(#{@d['dy']}) | #{spaced_wt} |  #{@d['min_t']}  |  #{@d['max_t']}  |  #{"%2s" % @d['p_day']}% (#{@d['p_zero']}%, #{@d['p_six']}%, #{@d['p_twelve']}%, #{@d['p_eighteen']}%)
EOB
      end

      def spaced_wt
        wt = @d['wt']
        wt + (4-wt.size).times.map{'　'}.join
      end

      def index
        "#{@d['ds']}は、#{@d['index_str']}。"
      end
    end
  end
end
