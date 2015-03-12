gulp = require 'gulp'
raml2html = require 'gulp-raml2html'
shell = require 'gulp-shell'

gulp.task 'doc', () ->
  gulp.src './schema/api.raml'
    .pipe raml2html()
    .pipe gulp.dest 'doc'

gulp.task 'mock', shell.task './node_modules/.bin/coffee mock.coffee'

gulp.task 'default', ['doc', 'mock']
