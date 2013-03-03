
init = ->

getAttributes = (field) ->
	str = ''
	if field.required? and field.required
		str += ' required '
	str

getLabel = (field) ->
	"<label for='#{field.name}'>#{field.label}:</label>"

getMessage = (field) ->
	"<span class='error' ng-show='test.#{field.name}.$error.required'>required</span>"

base = (field) ->
	ret =
		label: getLabel field
		attributes: getAttributes field
		msg: getMessage field
	ret

fields =
	text: (field) ->
		{ label, attributes, msg } = base field
		"""
			#{label}
			<input ng-model='data.#{field.name}' name='#{field.name}' type = 'text' #{attributes} >
			</input>
			#{msg}
		"""

replaceSingleQuotes = (html) ->
	html.replace /'/g, '"'

get = (field) ->
	html = fields[field.type] field
	replaceSingleQuotes html


exports.init = init
exports.get = get
