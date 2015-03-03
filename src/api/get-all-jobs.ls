require! bluebird: Promise
require! '../utils': { format-url }
require! 'data.maybe': Maybe
request = Promise.promisify require 'request'
debug   = require '../debug' <| __filename

module.exports = get-all-jobs = ->
  debug 'start'
  url = format-url '/api/json', tree: 'jobs[name]'
  request { url, +json }
    .get \1
    .then (map prop \name) . prop \jobs
