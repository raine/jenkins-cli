require! {
  './config'
  qs
}

debug = require './debug' <| __filename

export format-url = (path, qs-obj) ->
  base-url = config.jenkins-URL
  query = if qs-obj then "?#{qs.stringify qs-obj}" else ''
  url = base-url + path + query
  debug 'format-url url=%s', url
  url
