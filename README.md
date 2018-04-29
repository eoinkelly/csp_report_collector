# CSP Report Collector

**WORK IN PROGRESS: The UI for browsing reports is not built yet**

This trivial app allows you to collect Content-Security-Policy HTTP header
violation reports (via `POST /api/csp-report`). These reports are stored in the
DB and presented in a very basic way via the UI.

The intended use-case for this app is

* You have one or more web applications which you want to enable CSP on but don't want to break them during the transition so you configure the `Content-Security-Policy-Report-Only` header.
* You don't want to add a CSP reporting endpoint to the app
* You either can't or don't want to send your CSP reports to a service like https://report-uri.com/

Available routes:

```
$ mix phx.routes
      page_path  GET   /                CspReportCollectorWeb.PageController :index
csp_report_path  POST  /api/csp-report  CspReportCollectorWeb.CspReportController :index
```

Configuration of this app is done via environment variables (so this app runs great on Heroku):

```
export APP_URL_HOST=whereveryouhostthis.com # e.g. whimsical-blah-blah.herokuapp.com
export APP_URL_PORT= 443
export APP_URL_SCHEME=https
export DATABASE_URL=postgres://db_username:db_password@db_host_name.com:5432/db_name
export POOL_SIZE=18 # Heroku limits you to 20 connections so 18 leaves a few for migrations/iex etc.
export SECRET_KEY_BASE=some_random_value # run 'mix phx.gen.secret' to create this
export BASIC_AUTH_REALM="Protected area"
export BASIC_AUTH_USERNAME="some_username"
export BASIC_AUTH_PASSWORD="some_password"
```

A wrinkle to be aware of is that CSP Reports are submitted with the
`application/csp-report` MIME-type even though they are just JSON. This app
gets around that by rewriting the `Content-Type` header in a Plug.

## Background on Content-Security-Policy

Full details: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only

```
# Example policy violation report
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
mix deps.get
mix deps.compile

mix ecto.create
mix ecto.migrate

mix phx.server

# Submit a CSP report
curl --request POST \
  --url http://localhost:4000/api/csp-report \
  --header 'content-type: application/csp-report' \
  --data '{"csp-report":{"document-uri":"http://localhost:3000/respondents","referrer":"http://localhost:3000/assessments/3/edit","violated-directive":"img-src","effective-directive":"img-src","original-policy":"default-src '\''self'\''; object-src '\''none'\''; report-uri http://localhost:4000/api/csp-report","disposition":"report","blocked-uri":"data","line-number":1,"column-number":119126,"source-file":"http://localhost:3000/packs/application-8cd5120f6b9b13e3cfdc.js","status-code":200,"script-sample":""}}'

# open http://localhost:4000/ in browser to see submitted CSP reports
```
