json.array!(@stat_entries) do |stat_entry|
  json.extract! stat_entry,
                    :query_string,
                    :remote_addr,
                    :remote_host,
                    :request_method,
                    :request_uri,
                    :http_accept,
                    :http_user_agent,
                    :http_accept_encoding,
                    :http_accept_language,
                    :http_version,
                    :created_at
end
