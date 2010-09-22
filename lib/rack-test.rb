# rack-test patch for Ruby 1.9.x
# for multipart forms and UTF-8 characters
module Rack
  module Utils
    def escape(s)
      regexp = case
        when RUBY_VERSION >= "1.9" && s.encoding === Encoding.find('UTF-8')
          /([^ a-zA-Z0-9_.-\@]+)/u
        else
          /([^ a-zA-Z0-9_.-\@]+)/n
        end
      s.to_s.gsub(regexp) {
        '%'+$1.unpack('H2'*bytesize($1)).join('%').upcase
      }.tr(' ', '+')
    end
  end
end
