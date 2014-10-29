_ = require "lodash"
path = require "path"

module.exports = (grunt)->
  grunt.extendConfig
    "docs-markdown":
      all:
        expand: true
        cwd: "docs/_data/"
        src: "**/*.json"
        dest: "docs/api-reference/nightly/"
        ext: ".md"
        rename: (dest, matchedSrcPath) ->
          betterSrcPath = matchedSrcPath.replace "overview", "index"
          return path.join dest, betterSrcPath

    copy:
      "docs-index":
        expand: true
        cwd: "tasks/templates/docs-index/"
        src: "**/*.md"
        dest: "docs/api-reference/nightly/"

  getLiquidDataPath = (filePath)->
    liquidDataPath = filePath.replace "docs/_data/", "site.data."
    liquidDataPath = liquidDataPath.replace /\//g, "."
    liquidDataPath = liquidDataPath.replace ".json", ""
    liquidDataPath

  grunt.registerMultiTask "docs-markdown", "Generate API reference markdown from docs/_data/*.json", ->
    @files.forEach (file) =>
      apiEntry = JSON.parse grunt.file.read file.src[0]
      liquidDataPath = getLiquidDataPath(file.src[0])
      section = liquidDataPath.split(".")[3]?.toLowerCase()
      subsection = liquidDataPath.split(".")[4]?.toLowerCase()

      templateType = if apiEntry.overview
        "overview"
      else if apiEntry.component
        "component"
      else
        "javascript"

      templatePath = "tasks/templates/api_#{templateType}_entry.md"
      template = grunt.file.read templatePath
      console.log apiEntry.name
      markdownOutput = grunt.util._.template(template) {
        liquidDataPath: liquidDataPath
        entry: apiEntry
        section: section
        subsection: subsection
      }

      grunt.file.write file.dest, markdownOutput

    grunt.task.run "copy:docs-index"
