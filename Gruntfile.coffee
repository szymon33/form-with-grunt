# Gruntfile
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    #uglify:
    #  dist:
    #    src: ['js/libs/*' 'js/app.js'] # input
    #    dest: 'javascripts/global.min.js' #output
    #
    #

    copy:
      jquery:
        files:
          [
            { expand: true, cwd: 'bower_components/jquery/dist/', src: ['jquery.min.js', 'jquery.min.map'], dest: 'dist/js/' }
          ]

      foundation:
       files: [
           { expand: true, cwd: 'bower_components/foundation/js/', src: 'foundation.min.js', dest: 'dist/js/' }
           { expand: true, cwd: 'bower_components/modernizr/', src: 'modernizr.js', dest: 'dist/js/' }
           { expand: true, cwd: 'bower_components/foundation/scss/foundation/', src: '_functions.scss', dest: 'scss/foundation/' }
           { expand: true, cwd: 'bower_components/foundation/js/foundation/', src: 'foundation.reveal.js', dest: 'dist/js/' }
          ]

      images:
        files: [
            { expand: true, src: 'images/*.*', dest: 'dist/' }
          ]

      fontawsome:
        files: [
            { expand: true, cwd: 'bower_components/font-awesome', src: 'fonts/*.*', dest: 'dist/' }
            { expand: true, cwd: 'bower_components/font-awesome/scss', src: ['**'], dest: 'scss/font-awesome/' }
          ]

      fonts:
        files: [
            cwd: 'fonts'
            expand: true
            src: '*.*'
            dest: 'dist/fonts/'
          ]

    sass:
      dist:
        files: [
          expand: true
          cwd: 'scss'
          src: ['*.scss', '*.sass', '!_*.scss', '!_*.sass']
          dest: 'dist/stylesheets'
          ext: '.css'
        ]

    slim:
      options:
        pretty: true
      dist:
        files: [
          expand: true
          cwd: 'templates'
          src: ['*.slim', '!_*.slim']
          dest: 'dist'
          ext: '.html'
        ]

    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: 'coffee'
        src: ['*.coffee']
        dest: 'dist/js'
        ext: '.js'

    watch:
      options:
        livereload: true
        spawn: false

      js:
        files: 'coffee/*.coffee'
        tasks: ['coffee']

      sass:
        files: 'scss/*.scss'
        tasks: ['sass']

      templates:
        files: 'templates/**/*.slim'
        tasks: ['slim']

      copy:
        files: ['bower_components/bootstrap/dist/**/*', 'fonts/*']
        tasks: ['copy']

  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-slim')

  grunt.loadNpmTasks('grunt-contrib-watch')

  # Default task(s).
  grunt.registerTask('default', ['copy','sass', 'coffee', 'slim'])
