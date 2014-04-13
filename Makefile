default:
	coffee -b  -o dist -c src/RTObject.coffee

spec: default
	coffee -o test/spec -c test/src/RTObjectSpec.coffee
	osascript test/ReloadChrome.scpt
