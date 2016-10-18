'use strict'

require('./static/css/styles.scss')
require('./static/index.html')

const Elm = require('./elm/Main.elm')
const mainNode = document.getElementById('main')

Elm.Main.embed(mainNode)
