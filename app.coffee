express = require 'express'
connect = require 'connect'
captcha = require 'captcha'
forms = require './forms'

Mongolian = require 'mongolian'
server = new Mongolian
db = server.db 'forms'
formdata = db.collection "formdata"

port = 8080

app = express()

app.configure ->
	app.use express.bodyParser()
	app.use express.cookieParser()
	app.use express.cookieSession { secret: 'keyboard-cat' }
	app.use connect.compress()
	app.use express.static 'public'
	captchaOptions =
		url: '/captcha.jpg'
		color:'#0064cd'
		background: 'rgb(20,30,200)'
	app.use captcha(captchaOptions)


app.get '/:form/:language', (req, res) ->
	res.type 'html'
	res.write forms.getHead()
	res.write '<form name="test" ng-controller="FormCtrl" action="/submit" method="post">'
	res.write forms.getForm req.params.form, req.params.language
	res.write '<p>Enter the series of overlapping numbers in the captcha below to confirm that you are human.</p>'
	res.write '<img src="/captcha.jpg"/><br/><input type="text" name="digits"/>'
	res.write '<input type="submit" />'
	res.end '</form>'

app.post '/submit', (req, res) ->
	if req.body.digits is req.session.captcha
		delete req.body.digits
		formdata.insert req.body
		formdata.find().toArray (err, array) ->
			for obj in array
				delete obj['_id']
			res.end "#{JSON.stringify(array)}"
	else
		res.end "Invalid captcha try again."

forms.init()

app.listen port

console.log "Web server started on port #{port}."

