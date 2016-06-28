var gulp = require('gulp'),
    imagemin = require('gulp-imagemin'),
    sass = require('gulp-sass'),
    cleancss = require('gulp-clean-css'),
    uglify  = require('gulp-uglify'),
    rename = require('gulp-rename'),
    concat  = require('gulp-concat'),
    clean = require('gulp-clean'),
    tinylr = require('tiny-lr'),
    server = tinylr(),
//  browserSync = require('browser-sync'),
//  port = 35729,
    livereload = require('gulp-livereload');

gulp.task('html', function() {
    gulp.src('./src/*.html')
        .pipe(gulp.dest('./dist/'))
        .pipe(livereload(server))
});

gulp.task('css', function () {
    gulp.src('./src/scss/*.scss')
        .pipe(sass.sync().on('error', sass.logError))
        .pipe(gulp.dest('./css'))
        .pipe(rename({ suffix: '.min' }))
        .pipe(cleancss())
        .pipe(livereload(server))
        .pipe(gulp.dest('./css'))
        .pipe(gulp.dest('./dist/css'));
});

gulp.task('images', function(){
    gulp.src('./src/images/**/*')
        .pipe(imagemin())
        .pipe(livereload(server))
        .pipe(gulp.dest('./dist/images'));
})

gulp.task('fonts', function () {
    gulp.src('./src/fonts/*')
        .pipe(gulp.dest('./dist/fonts'))
});

gulp.task('player', function () {
    gulp.src('./src/player/*')
        .pipe(gulp.dest('./dist/player'))
});

gulp.task('js', function () {
    gulp.src('./src/js/*.js')
        .pipe(concat('main.js'))
        .pipe(gulp.dest('./dist/js'))
        .pipe(rename({ suffix: '.min' }))
        .pipe(uglify())
        .pipe(livereload(server))
        .pipe(gulp.dest('./dist/js'));
});
//
// gulp.task('serve', function() {
//     browserSync({
//         files: "**",
//         server: {
//             baseDir: "./"
//         }
//     });
//     gulp.watch('./src/*.html',['html']);
//     gulp.watch('./src/scss/*/*.scss',['css']);
//     gulp.watch('./src/images/**/*',['images']);
//     gulp.watch('./src/js/*.js',['js']);
//     browserSync.reload();
// });

gulp.task('clean', function() {
    gulp.src(['./dist/css', './dist/js', './dist/images', '.dist/fonts'], {read: false})
        .pipe(clean());
});

gulp.task('default', ['clean'], function(){
    gulp.start('html','css','images','js', 'fonts', 'player');
});

gulp.task('watch',function(){
    livereload.listen()
    gulp.watch('./src/*.html',['html']);
    gulp.watch('./src/scss/*/*.scss',['css']);
    gulp.watch('./src/images/**/*',['images']);
    gulp.watch('./src/js/*.js',['js']);
});
