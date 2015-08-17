gulp    = require "gulp"
compass = require "gulp-compass"
del     = require "del"

# Cleanup working directory
gulp.task "clean", del.bind(null, ["dest"])

# Compile SCSS files
gulp.task "compile", () ->
  gulp.src "src/**/*.scss"
    .pipe compass(
      config_file: "config.rb"
      css:         "dest/"
      sass:        "src/"
    )

# Watch source files and auto compile
gulp.task "watch", () ->
  gulp.watch "src/**/*.scss", ["compile"]

gulp.task "default", ["watch"]
