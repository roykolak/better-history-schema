mongoose = require('mongoose')

tag = mongoose.Schema
  name:
    type: String
    required: true
  slug:
    type: String
    required: true
  sites: [{
    url:
      type: String
      required: true
    title:
      type: String
      required: true
    datetime:
      type: String
      required: true
    image:
      type: String
      required: true
  }]

tag.path('sites').validate (value) ->
  false unless value?
, 'missing sites'

tag.path('name').validate (value) ->
  !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value)
, 'Invalid tag name'

exports.tag = tag