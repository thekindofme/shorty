class Link < ActiveRecord::Base
  has_many :stat_entries

  validate :url, url: true
  validates_uniqueness_of :url

  after_create do |link|
    link.update_attribute(
      :shortended_url,
      # TODO: fix the hard coded localhost:3000 to something more dynamic and configurable
      Rails.application.routes.url_helpers.shortenend_link_url(code: link.shorten, host: 'localhost:3000')
    )
  end

  # ((0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.join
  CHAR_SET = "DS6COWLPcapHEh1M8tRmqb0dVXkAzi27GyQvZgxNusYUBoef3lIFJKTrjw549n"

  def shorten
    BijectiveBaseN.encode(self.id, CHAR_SET)
  end

  def self.reverse shortended_url
    Link.find(BijectiveBaseN.decode(shortended_url, CHAR_SET))
  end
end
