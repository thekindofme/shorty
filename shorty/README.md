Setup Instructions
==================

The application uses SQLite.

    bundle
    bundle exec rake db:migrate

To run the specs for the first time

    bundle
    RAILS_ENV=test bundle exec rake db:migrate

then

    rspec

Web UI
======

Root path (/) will show a simple UI where a user can enter a URL which will then be shortened and presented to the user.

API
===

Link Shortening
---------------
    POST http://localhost:3000/shorten.json with parameter link[:url] => long_url

Result

```json
    {
        "url": "https://bitly.com/shorten/",
        "shortended_url": "http://localhost:3000/C",
        "created_at": "2013-11-07T16:19:30.402Z",
        "updated_at": "2013-11-07T16:19:30.402Z"
    }
```

Redirection
-----------
As expected any shortenend link generated ie: http://localhost:3000/C will get redirected to the original URL.

Stats
-----
To get the stats for http://localhost:3000/C

    GET http://localhost:3000/stats/C.json

Result (when the shortenend link has been accessed two times

```json
    [
        {
            "query_string": "",
            "remote_addr": "127.0.0.1",
            "remote_host": "127.0.0.1",
            "request_method": "GET",
            "request_uri": "http://localhost:3000/C",
            "http_accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "http_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36",
            "http_accept_encoding": "gzip,deflate,sdch",
            "http_accept_language": "en-US,en;q=0.8",
            "http_version": "HTTP/1.1",
            "created_at": "2013-11-07T16:23:55.000Z"
        },
        {
            "query_string": "",
            "remote_addr": "127.0.0.1",
            "remote_host": "127.0.0.1",
            "request_method": "GET",
            "request_uri": "http://localhost:3000/C",
            "http_accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "http_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36",
            "http_accept_encoding": "gzip,deflate,sdch",
            "http_accept_language": "en-US,en;q=0.8",
            "http_version": "HTTP/1.1",
            "created_at": "2013-11-07T16:24:04.000Z"
        }
    ]
```
