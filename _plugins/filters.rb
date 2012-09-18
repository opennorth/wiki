# coding: utf-8
module Jekyll
  module Filters
    def post_date(date, locale)
      if locale == 'en'
        # https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/en.yml
        format = '%B %e, %Y'
        a = %w(Sun Mon Tue Wed Thu Fri Sat)
        big_a = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
        b = [nil] + %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
        big_b = [nil] + %w(January February March April May June July August September October November December)
      else
        # https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/fr-CA.yml
        format = '%e %B %Y'
        a = %w(dim lun mar mer jeu ven sam)
        big_a = %w(dimanche lundi mardi mercredi vendredi samedi)
        b = [nil] + %w(jan. fév. mar. avr. mai juin juil. août sept. oct. nov. déc.)
        big_b = [nil] + %w(janvier février mars avril mai juin juillet août septembre octobre novembre décembre)
      end
      # I18n#localize
      format = format.to_s.gsub(/%[aAbBp]/) do |match|
        case match
        when '%a' then a[date.wday]
        when '%A' then big_a[date.wday]
        when '%b' then b[date.mon]
        when '%B' then big_b[date.mon]
        end
      end
      date.strftime format
    end

    def pretty_url(string)
      string = "/#{string}" unless string[0] == '/'
      string.sub('index.html', '').sub('.html', '/')
    end

    def classify(string)
      string.gsub(%r{^/|/$}, '').gsub('/', '-')
    end
  end
end
