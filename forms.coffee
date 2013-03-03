fs = require 'fs'
angulargen = require './angulargen'

fields = {}
translations = {}
footer = ''
header = ''

init = ->
	fieldstr = fs.readFileSync 'fields.json', 'utf8'
	fields = JSON.parse fieldstr
	languages = ['english', 'spanish']
	for language in languages
		translationstr = fs.readFileSync "#{language}.json", 'utf8'
		translations[language] = JSON.parse translationstr
	angulargen.init()
	footer = fs.readFileSync 'footer.html', 'utf8'
	header = fs.readFileSync 'header.html', 'utf8'

translate = (form, field, language) ->
	translation = translations[language][form][field.name]
	for property, val of translation
		field[property] = val

getForm = (formName, language) ->
	str = ''
	form = fields[formName]
	for field in form
		translate formName, field, language
		str += angulargen.get field

	str += footer

getHead = -> header

exports.init = init
exports.getForm = getForm
exports.getHead = getHead
