# encoding: UTF-8

module CldrPlurals
  module RubyRuntime
    class << self

      def build_args_for(num_str)
        [
          n(num_str), i(num_str), f(num_str),
          t(num_str), v(num_str), w(num_str)
        ]
      end

      def n(str)
        to_num(
          if str.include?('.')
            _n(str).gsub(/([0]+\z)/, '').chomp('.')
          else
            _n(str)
          end
        )
      end

      def i(str)
        to_num(_i(str))
      end

      def f(str)
        to_num(_f(str))
      end

      def t(str)
        to_num(_t(str))
      end

      def v(str)
        to_num(_v(str))
      end

      def w(str)
        to_num(_w(str))
      end

      private

      def to_num(str)
        str.include?('.') ? str.to_f : str.to_i
      end

      # absolute value of the source number (integer and decimals).
      def _n(str)
        str.gsub(/(-)(.*)/, '\2')
      end

      # integer digits of n.
      def _i(str)
        _n(str).gsub(/([\d]+)(\..*)/, '\1')
      end

      # visible fractional digits in n, with trailing zeros.
      def _f(str)
        _n(str).gsub(/([\d]+\.?)(.*)/, '\2')
      end

      # visible fractional digits in n, without trailing zeros.
      def _t(str)
        _f(str).gsub(/([0]+\z)/, '')
      end

      # number of visible fraction digits in n, with trailing zeros.
      def _v(str)
        _f(str).length.to_s
      end

      # number of visible fraction digits in n, without trailing zeros.
      def _w(str)
        _t(str).length.to_s
      end

    end
  end
end
