class StatEntry < ActiveRecord::Base
  belongs_to :link

  validates_presence_of :link_id

  def self.build_from_hash hash, link
    new_stat_entry = link.stat_entries.new
    attrs = new_stat_entry.attributes.keys - ['id', 'link_id', 'created_at', 'updated_at', 'http_cookie']

    attrs.each do |attr|
      new_stat_entry.send("#{attr}=", hash[attr.upcase])
    end

    new_stat_entry
  end
end
