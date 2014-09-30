// Gulpfile.js
// Require the needed packages
var gulp         = require('gulp'),
    gutil        = require('gulp-util'),
    rename       = require('gulp-rename'),
    browserify   = require('gulp-browserify'),
    plumber      = require('gulp-plumber'),
    path         = require('path');

var baseSrcPath  = path.join(__dirname, 'src'),
    baseDestPath = path.join(__dirname, 'app', 'assets'),
    baseJsPath   = path.join(baseSrcPath, 'js');

var paths = {
  coffeeInput    : path.join(baseJsPath, 'app.coffee'),
  coffeeOutput   : path.join(baseDestPath, 'javascripts', 'woo')
}

var watchPaths = {
  coffee: [
    path.join(baseJsPath, '**', '*.coffee')
  ]
}

//
// Coffee
//

gulp.task('coffee', function() {
  return gulp.src(paths.coffeeInput, { read: false })
    .pipe(plumber())
    .pipe(browserify({
      basedir: __dirname,
      transform: ['coffeeify'],
      extensions: ['.coffee']
    }).on('error', gutil.log)
      .on('error', gutil.beep))
    .pipe(rename('application.js'))
    .pipe(gulp.dest(paths.coffeeOutput));
});

//
// Watch
//
gulp.task('watch', function(callback) {
  gulp.watch(watchPaths.coffee, ['coffee']);
});

gulp.task('default', ['coffee']);
