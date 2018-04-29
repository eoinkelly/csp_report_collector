# CSP Report Collector


https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only


```
POST /csp-report
{
  "csp-report": {
    "document-uri": "http://example.com/signup.html",
    "referrer": "",
    "blocked-uri": "http://example.com/css/style.css",
    "violated-directive": "style-src cdn.example.com",
    "original-policy": "default-src 'none'; style-src cdn.example.com; report-uri /_/csp-reports",
    "disposition": "report"
  }
}
```

# Developer setup

```
mix phx.new APPNAME --no-brunch
mix deps.get
mix deps.compile
cd APPNAME

mix ecto.create # creates APPNAME_dev but doesn't change the repo
mix ecto.migrate

# run the server
mix phx.server
# or
iex -S mix phx.server

curl http://localhost:4000
```
