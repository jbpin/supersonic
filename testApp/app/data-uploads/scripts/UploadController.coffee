angular
  .module('data-uploads')
  .directive("selectFileAs", ->
    restrict: 'A'
    scope:
      'selectFileAs': '='
    link: (scope, element, attributes) ->
      # Bind file from input to scope
      element.bind "change", (event) ->
        scope.$apply ->
          scope.selectFileAs = event.target.files[0]

      # We can't write anything to the input but we can clear it if needed
      scope.$watch 'selectFileAs', (selectedFile) ->
        if !selectedFile
          element.val(null)
  )
  .controller 'UploadController', ($scope, supersonic, SandboxFileResource) ->
    $scope.record = new SandboxFileResource {}
    $scope.uploads = []

    $scope.upload = ->
      supersonic.logger.log "About to start upload"
      $scope.record.save().then (uploaded) ->
        $scope.$apply ->
          supersonic.logger.log "Upload complete"
          $scope.record = new SandboxFileResource {}
          $scope.uploads.push uploaded

