class CreateStatEntries < ActiveRecord::Migration
  def change
    create_table :stat_entries do |t|
      t.integer :link_id
      t.string :query_string
      t.string :remote_addr
      t.string :remote_host
      t.string :request_method
      t.string :request_uri
      t.string :http_accept
      t.string :http_user_agent
      t.string :http_accept_encoding
      t.string :http_accept_language
      t.string :http_cookie
      t.string :http_version

      t.timestamps
    end
  end
end
