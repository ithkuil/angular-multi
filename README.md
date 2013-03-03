Let's make interactive browser based app. It will be done with (Rails/Node backed) Angular.js.

The core of the app is very simple: one form of fields. The complexity is in following requirements:
- there are a dozen of variations of the form based on type of user
- international, that means multilingual. Every type of form needs to be usable in a dozen of languages.
- most fields need to be validated. The validation rules are not super-complex, mostly requirements of being filled and being filled according to regexp.
- probably most complex part of the app is to stay safe of from bots. That means we need to implementing CAPTCHA in some specific form. The challenge will probably come from server. Other bot deterrent might be needed.
- ideally the rendering can be styled heavily by external parametrisation (this will be optional)
- the layout should fit on large (desktop) as well as small (mobile phones) screen, thus it should be responsive
- also we might like to encrypt the form contents in client-side public key cryptography

Naturally I'd love to have easy to maintain deliverable, which means useful test, especially smoke tests.

The server side component need to re-validate the forms according the same rules. In addition to that:
- it needs to store the information in encrypted form (perhaps public key cryptography)
- the storage could be some form of easily backed up database. We'll use perhaps Mongo.
- the server side app will be hosted on dedicated server, thus we get to choose the database
- again, the most complex part of the server is probably the bot / spam avoidance. It might need to serve CAPTCHAs, keep books of IPs, non-human-like browsing etc.

Work will happen over shared Git repo. You need to license all of the code under MIT license.

Rough idea of iterations:

First round is just a skeleton and proof of concept. First language, one form, most of validation.
Second version, multilingual. User session. Server side validation.
3 version, all types of forms. CAPTCHA etc.
4 version, rest of bot deterrent features.
5 version, all combinations of languages and forms. All tests for validations.
6 version, dynamic styling
7 version, validation of source and proof of visit.

I'll deliver the sketch of the UI, and naturally all requirements and things needed. The translations will be worked during the project. I can't guarantee they will be ready.

I suggest we will build on top of https://github.com/CaryLandholt/AngularFun Or do suggest a better starting point. I'd love to have the app in CoffeeScript. To start, make sure you have working node, npm and grunt environment.

I'll share a repo, but you can start right away on that.

The app should be in production by end of March. Naturally we aim to have a working release in production at the end of each iteration (release).

As the app is quite limited, it is possible you complete all the development in condensed amount of hours. Thus the above deadline is only in calendar time -- you might be ready in few days.
