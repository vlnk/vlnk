const Gulp = require('gulp');
const Shell = require('gulp-shell');
const clean = require('gulp-clean');

Gulp.task('watch', function() {
  Gulp.watch('contents/en/*.tex', ['full'])
});
Gulp.task('full', ['tex', 'clean'])

var tex = Shell.task(['lualatex cv -halt-on-error']);
Gulp.task('tex', tex);

var texOutput = [
  '*.aux',
  '*.bbl',
  '*.blg',
  '*.glg',
  '*.glo',
  '*.gls',
  '*.ist',
  '*.lof',
  '*.log',
  '*.lol',
  '*.out',
  '*.toc'
];

Gulp.task('clean', ['tex'], function() {
  Gulp.src(texOutput).pipe(clean({force: true}))
});
