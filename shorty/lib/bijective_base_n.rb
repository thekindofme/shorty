class BijectiveBaseN
  # ref/sources/based on: 
  # 
  # http://ruby-doc.org/stdlib-2.0.0/libdoc/base64/rdoc/Base64.html
  # http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener
  # https://gist.github.com/zumbojo/1073996
  # http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby

  def self.encode(i, char_set)
    return char_set[0] if i == 0
    s = ''
    base = char_set.length
    while i > 0
      s << char_set[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.decode(s, char_set)
    i = 0
    base = char_set.length
    s.each_char { |c| i = i * base + char_set.index(c) }
    i
  end
end
