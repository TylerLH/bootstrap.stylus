/*!
 * bootstrap-stylus
 */

/**
 * Module dependencies.
 */

var nib = require('nib');
var path = require('path');

module.exports = function(){
  return function(style){
    style.include(__dirname + '/../styl');
    style.use(nib());
  }
};
