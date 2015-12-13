# Generated on 2014-03-22 using generator-jekyllrb 1.2.1
"use strict"

# Directory reference:
#   css: css
#   sass: _scss
#   javascript: js
#   coffeescript: _coffee
#   images: img
#   fonts: fonts
module.exports = (grunt) ->

  # Show elapsed time after tasks run
  require("time-grunt") grunt

  # Load all Grunt tasks
  require("load-grunt-tasks") grunt

  # initConfig
  grunt.initConfig

    # Configurable paths
    yeoman:
      app: "app"
      dist: "dist"

    # grunt-contrib-watch
    watch:
      sass:
        files: ["<%= yeoman.app %>/_scss/**/*.{scss,sass}"]
        tasks: [
          "sass:server"
          "autoprefixer:server"
        ]
      less:
        files: ["<%= yeoman.app %>/_less/**/*.less"]
        tasks: [
          "less:dist"
          "autoprefixer:server"
        ]
      jade:
        files: ["<%= yeoman.app %>/_jade/**/*.jade"]
        tasks: ["jade:dist"]
      autoprefixer:
        files: ["<%= yeoman.app %>/css/**/*.css"]
        tasks: [
          "copy:stageCss"
          "autoprefixer:server"
        ]
      coffee:
        files: ["<%= yeoman.app %>/_coffee/**/*.coffee"]
        tasks: ["coffee:dist"]
      coffeeTest:
        files: ["test/spec/**/*.coffee"]
        tasks: ["coffee:test"]
      jekyll:
        files: [
          "<%= yeoman.app %>/**/*.{html,yml,md,mkd,markdown}"
          "!<%= yeoman.app %>/_bower_components/**/*"
        ]
        tasks: ["jekyll:server"]
      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"
        files: [
          ".jekyll/**/*.html"
          ".tmp/css/**/*.css"
          "{.tmp,<%= yeoman.app %>}/<%= js %>/**/*.js"
          "<%= yeoman.app %>/img/**/*.{gif,jpg,jpeg,png,svg,webp}"
        ]

    # grunt-contrib-connect
    connect:
      options:
        port: 9000
        livereload: 35729
        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"
      livereload:
        options:
          open: true
          base: [
            ".tmp"
            ".jekyll"
            "<%= yeoman.app %>"
          ]
      dist:
        options:
          open: true
          base: ["<%= yeoman.dist %>"]
      test:
        options:
          base: [
            ".tmp"
            ".jekyll"
            "test"
            "<%= yeoman.app %>"
          ]

    # grunt-contrib-clean
    clean:
      dist:
        files: [
          dot: true
          src: [
            "<%= yeoman.dist %>/*"
            # Running Jekyll also cleans the target directory.  Exclude any
            # non-standard `keep_files` here (e.g., the generated files
            # directory from Jekyll Picture Tag).
            "!<%= yeoman.dist %>/.git*"
          ]
        ]
      server: [
        ".tmp"
        ".jekyll"
      ]

    # grunt-contrib-sass
    sass:
      options:
        bundleExec: true
        debugInfo: false
        lineNumbers: false
        loadPath: "app/_bower_components"
        sourcemap: "auto"
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/_scss"
          src: "**/*.{scss,sass}"
          dest: ".tmp/<%= cssDir %>"
          ext: ".css"
        ]
      server:
        options:
          debugInfo: true
          lineNumbers: true
        files: [{
          expand: true
          cwd: "<%= yeoman.app %>/_scss"
          src: "**/*.{scss,sass}"
          dest: ".tmp/css"
          ext: ".css"
        }]

    # grunt-contrib-less
    less:
      options:
        sourceMap: true
      dist:
        files: [{
          expand: true
          cwd: "<%= yeoman.app %>/_less"
          src: "*.less"
          dest: ".tmp/css"
          ext: ".css"
        }]

    # grunt-contrib-less
    jade:
      options:
        pretty: true
      dist:
        files: [{
          expand: true
          cwd: "<%= yeoman.app %>/_jade"
          src: "**/*.jade"
          dest: "<%= yeoman.app %>"
          ext: ".html"
        }]

    # grunt-autoprefixer
    autoprefixer:
      options:
        browsers: ["last 2 versions"]
      dist:
        files: [{
          expand: true
          cwd: "<%= yeoman.dist %>/css"
          src: "**/*.css"
          dest: "<%= yeoman.dist %>/css"
        }]
      server:
        files: [{
          expand: true
          cwd: ".tmp/css"
          src: "**/*.css"
          dest: ".tmp/css"
        }]

    # grunt-contrib-coffee
    coffee:
      dist:
        options:
          sourceMap: true
        files: [{
          expand: true
          cwd: "<%= yeoman.app %>/_coffee"
          src: "**/*.coffee"
          dest: ".tmp/js"
          ext: ".js"
        }]
      test:
        files: [{
          expand: true
          cwd: "test/spec"
          src: "**/*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        }]

    # grunt-jekyll
    jekyll:
      options:
        bundleExec: true
        config: "_config.yml,_config.build.yml"
        src: "<%= yeoman.app %>"
      dist:
        options:
          dest: "<%= yeoman.dist %>"
      server:
        options:
          config: "_config.yml"
          dest: ".jekyll"
      check:
        options:
          doctor: true

    # grunt-usemin
    useminPrepare:
      options:
        dest: "<%= yeoman.dist %>"
      html: "<%= yeoman.dist %>/index.html"
    usemin:
      options:
        assetsDirs: "<%= yeoman.dist %>"
      html: ["<%= yeoman.dist %>/**/*.html"]
      css: ["<%= yeoman.dist %>/css/**/*.css"]

    # grunt-contrib-htmlmin
    htmlmin:
      dist:
        options:
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeAttributeQuotes: true
          removeRedundantAttributes: true
        files: [{
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "**/*.html"
          dest: "<%= yeoman.dist %>"
        }]

    # Usemin adds files to concat
    concat: {}

    # Usemin adds files to uglify
    uglify: {}

    # Usemin adds files to cssmin
    cssmin:
      dist:
        options:
          check: "gzip"

    # grunt-contrib-imagemin
    imagemin:
      dist:
        options:
          progressive: true
        files: [{
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "**/*.{jpg,jpeg,png}"
          dest: "<%= yeoman.dist %>"
        }]

    # grunt-svgmin
    svgmin:
      dist:
        files: [{
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "**/*.svg"
          dest: "<%= yeoman.dist %>"
        }]

    # grunt-contrib-copy
    copy:
      dist:
        files: [{
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          src: [
            # Jekyll processes and moves HTML and text files.
            # Usemin moves CSS and javascript inside of Usemin blocks.
            # Copy moves asset files and directories.
            "img/**/*"
            "fonts/**/*"
            # Like Jekyll, exclude files & folders prefixed with an underscore.
            "!**/_*{,/**}"
            # Explicitly add any files your site needs for distribution here.
            "favicon.ico"
            "apple-touch*.png"
          ]
          dest: "<%= yeoman.dist %>"
        }]
      # Copy CSS into .tmp directory for Autoprefixer processing
      stageCss:
        files: [{
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>/css"
          src: "**/*.css"
          dest: ".tmp/css"
        }]

    # grunt-filerev
    filerev:
      options:
        length: 4
      dist:
        files: [src: [
          "<%= yeoman.dist %>/js/**/*.js"
          "<%= yeoman.dist %>/css/**/*.css"
          "<%= yeoman.dist %>/img/**/*.{gif,jpg,jpeg,png,svg,webp}"
          "<%= yeoman.dist %>/fonts/**/*.{eot*,otf,svg,ttf,woff}"
        ]]

    # grunt-build-control
    buildcontrol:
      dist:
        options:
          remote: "../"
          branch: "gh-pages"
          commit: true
          push: true

    # grunt-coffeelint
    coffeelint:
      options:
        max_line_length:
          level: "ignore"
      check: ["<%= yeoman.app %>/_coffee/*.coffee"]

    # grunt-contrib-jshint
    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")
      all: [
        "Gruntfile.js"
        "<%= yeoman.app %>/js/**/*.js"
        "test/spec/**/*.js"
      ]

    # grunt-contrib-csslint
    csslint:
      options:
        csslintrc: ".csslintrc"
      check:
        src: [
          "<%= yeoman.app %>/css/**/*.css"
        ]

    # grunt-concurrent
    concurrent:
      server: [
        "sass:server"
        "less:dist"
        "coffee:dist"
        "jade:dist"
        "copy:stageCss"
        "jekyll:server"
      ]
      dist: [
        "sass:dist"
        "less:dist"
        "coffee:dist"
        "jade:dist"
        "copy:dist"
      ]
  # End of initConfig

  # Define Tasks
  grunt.registerTask "serve", (target) ->
    if target is "dist"
      return grunt.task.run([
        "build"
        "connect:dist:keepalive"
      ])
    grunt.task.run [
      "clean:server"
      "concurrent:server"
      "autoprefixer:server"
      "connect:livereload"
      "watch"
    ]
    return

  grunt.registerTask "server", ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run ["serve"]
    return

  # No real tests yet. Add your own.
  grunt.registerTask "test", []
  #   'clean:server',
  #   'concurrent:test',
  #   'connect:test'

  grunt.registerTask "check", [
    "clean:server"
    "jekyll:check"
    "sass:server"
    "coffeelint:check"
    "coffee:dist"
    "jshint:all"
    "csslint:check"
  ]

  grunt.registerTask "build", [
    "clean"
    # Jekyll cleans files from the target directory, so must run first
    "jekyll:dist"
    "concurrent:dist"
    "useminPrepare"
    "concat"
    "autoprefixer:dist"
    "cssmin"
    "uglify"
    "imagemin"
    "svgmin"
    "filerev"
    "usemin"
    "htmlmin"
  ]

  grunt.registerTask "deploy", [
    "check"
    "test"
    "build"
    "buildcontrol"
  ]

  grunt.registerTask "default", [
    "check"
    "test"
    "build"
  ]
  return
