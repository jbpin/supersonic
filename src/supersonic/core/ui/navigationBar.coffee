Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.navigationBar', log

  getNativeState: s.promiseF "getNativeState", (options = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.getNativeState {},
        onSuccess: resolve
        onFailure: reject

  getButtonById: s.promiseF "getButtonById", (options = {})->
    if @options.constructor?.name == "String"
      @options =
        id: @options

    getNativeState().then (navBarState)->
      right = navBarState.buttons["right"].find (button)-> button.id == @options.id
      left = navBarState.buttons["left"].find (button)-> button.id == @options.id

      return unless right? || left?

      buttonParams = right || left
      return new supersonic.ui.NavigationBarButton buttonParams

  ###
   # @namespace supersonic.ui
   # @name navigationBar
   # @overview
   # @description
   # Provides methods to work with the native navigation bar. For more information, see the [Navigation Bar guide](/supersonic/guides/ui/native-components/navigation-bar/).
  ###
  ###
   # @namespace supersonic.ui.navigationBar
   # @name show
   # @function
   # @description
   # Shows the native navigation bar for the current view.
   # @type
   # supersonic.ui.navigationBar.show: (
   #   options?:
   #     animated?: Boolean
   # ) => Promise
   # @define {Object} options={} An object of optional parameters which define how the navigation bar will be shown.
   # @define {Boolean} options.animated=true Determines if the navigation bar will be shown with an animation.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar is shown.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.show()
   #
   # # with options
   # options =
   #   animated: false
   # supersonic.ui.navigationBar.show(options).then ->
   #   supersonic.logger.log "Navigation bar shown without animation."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.show();
   #
   # // with options
   # var options = {
   #   animated: false
   # }
   #
   # supersonic.ui.navigationBar.show(options).then( function() {
   #   supersonic.logger.debug("Navigation bar shown without animation.");
   # });
   #
  ###
  show: s.promiseF "show", (options = {})->
    filteredParams =
      animated: options.animated

    new Promise (resolve, reject)->
      steroids.view.navigationBar.show filteredParams,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.navigationBar
   # @name hide
   # @function
   # @description
   # Hides the native navigation bar for the current view.
   # @type
   # supersonic.ui.navigationBar.hide: (
   #   options?:
   #     animated?: Boolean
   # ) => Promise
   # @define {Object} options An object of optional parameters which define how the navigation bar will be hidden.
   # @define {Boolean} animated=true If `false`, the navigation bar will be hidden without an animation.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar is hidden. If the navigation bar cannot be hidden (e.g. it is already hidden), the promise will be rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.hide()
   #
   # # with options
   # options =
   #   animated: true
   #
   # supersonic.ui.navigationBar.hide(options).then ->
   #   supersonic.logger.debug "Navigation bar hidden without animation."
   #
   # @exampleJavaScript
   # supersonic.ui.navigationBar.hide();
   #
   # // with options
   # var options = {
   #   animated: true
   # }
   #
   # supersonic.ui.navigationBar.hide(options).then( function() {
   #   supersonic.logger.debug("Navigation bar hidden without animation.");
   # });
  ###
  hide: s.promiseF "hide", (options = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.hide options,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.navigationBar
   # @name update
   # @function
   # @description
   # Updates the navigation bar. Only properties defined in the options object are affected. Other properties will continue to use the previous (or default) value.
   # @type
   # supersonic.ui.navigationBar.update: (
   #   options:
   #     title?: String
   #     overrideBackButton?: Boolean
   #     backButton?: NavigationBarButton
   #     buttons?:
   #       left?: Array<NavigationBarButton>
   #       right?: Array<NavigationBarButton>
   # )
   # @define {Object} options An object of optional parameters which defines how the navigation bar will be updated.
   # @define {String} title Navigation bar title text.
   # @define {Boolean} overrideBackButton=false If `true`, the automatic back button will not be shown. If defined, the first left button will be shown on its place.
   # @define {NavigationBarButton} backButton A supersonic.ui.NavigationBarButton that will be used in place of the native back button.
   # @define {Object} buttons= An object determining the buttons that will be shown on either side of the navigation bar.
   # @define {Array<NavigationBarButton} buttons.left=[] An array of NavigationBarButtons to be shown on the left side of the navigation bar (i.e. left side of the title text/image). Passing an empty array will remove all buttons.
   # @define {Array<NavigationBarButton} buttons.right=[] An array of NavigationBarButtons to be shown on the right side of the navigation bar (i.e. right side of the title text/image). Passing an empty array will remove all buttons.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar has been updated. If the navigation bar cannot be updated, the promise will be rejected.
   # @supportsCallbacks
   # @exampleJavaScript
   # leftButton = new supersonic.ui.NavigationBarButton( {
   #   title: "Left",
   #   onTap: function() {
   #     supersonic.ui.dialog.alert("Left button tapped!");
   #   }
   # });
   #
   # options = {
   #   title: "New title",
   #   overrideBackButton: true,
   #   buttons: {
   #     left: [leftButton]
   #   }
   # }
   #
   # supersonic.ui.navigationBar.update(options);
   # @exampleCoffeeScript
   # leftButton = new supersonic.ui.NavigationBarButton
   #   title: "Left"
   #   onTap: ->
   #     supersonic.ui.dialog.alert "Left button tapped!"
   #
   # options =
   #   title: "New title"
   #   overrideBackButton: true
   #   buttons:
   #     left: [leftButton]
   #
   # supersonic.ui.navigationBar.update options
  ###
  update: s.promiseF "update", (options)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.update options,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setClass
   # @function
   # @description
   # Adds a CSS class name to the navigation bar. Any previous CSS classes will be overriden. **Note:** At the moment, setting CSS classes for the navigation bar affects the whole navigation stack, not just the current view.
   # @type
   # setClass: (
   #   className: String
   # ) => Promise
   # @define {String} className="" A string of one or more CSS class names, separated by spaces.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar CSS class is set.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setClass("my-class").then ()->
   #   supersonic.logger.log "Navigation bar class was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setClass("my-class").then(function() {
   #   supersonic.logger.log("Navigation bar class was set.");
   # });
   #
  ###
  setClass: s.promiseF "setClass", (className)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleClass className,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setStyle
   # @function
   # @description
   # Sets inline CSS styling to the navigation bar. Any previous inline styles are overridden. **Note:** At the moment, setting inline CSS styles for the navigation bar affects the whole navigation stack, not just the current view.
   # @type
   # setStyle: (
   #   inlineCssString: String
   # ) => Promise
   # @define {String} inlineCssString="" A string of inline CSS styling.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar style is set.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setStyle("background-color: #ff0000;").then ()->
   #   supersonic.logger.log "Navigation bar style was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setStyle("background-color: #ff0000;").then(function() {
   #   supersonic.logger.log("Navigation bar style was set.");
   # });
   #
  ###
  setStyle: s.promiseF "setStyle", (inlineCssString)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleCSS inlineCssString,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setStyleId
   # @function
   # @description
   # Sets a CSS style id for navigation bar. Any previous id will be overridden. **Note:** At the moment, setting a CSS style id for the navigation bar affects the whole navigation stack, not just the current view.
   # @apiCall supersonic.ui.navigationBar.setStyleId
   # @type
   # setStyleId: (
   #   id: String
   # ) => Promise
   # @define {String} id="" The style id to set.
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that will be resolved after the navigation bar style id is set.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setStyleId("the-button").then ()->
   #   supersonic.logger.log "Navigation bar style id was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setStyleId("the-button").then(function() {
   #   supersonic.logger.log("Navigation bar style id was set.");
   # });
   #
  ###
  setStyleId: s.promiseF "setStyleId", (styleId)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleId styleId,
        onSuccess: resolve
        onFailure: reject
