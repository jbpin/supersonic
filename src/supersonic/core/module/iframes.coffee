Promise = require 'bluebird'

module.exports = (window) ->

  IFRAME_SELECTOR = "iframe[data-module]"
  IFRAME_USE_LOAD_INDICATOR_ATTR = "data-module-indicate-loading"
  IFRAME_NAME_ATTR = "data-module-name"
  LOAD_INDICATOR_TEMPLATE = """
    <div class="super-module__load-indicator">
      <i class="icon super-loading-c"></i>
      &nbsp;
      Loading
      <b bind-module-name></b>...
    </div>
  """

  ###
  Initial operations
  ###

  window.document.addEventListener "DOMContentLoaded", ->
    Promise.delay(0).then ->
      if window.document.body.querySelectorAll("[data-module-load-indicator-template]").length
        setLoadIndicatorTemplate(window.document.body.querySelectorAll("[data-module-load-indicator-template]")[0].innerHTML)
      observeDocumentForNewModules()
      findAll().map attachToOnLoad

  ###
  Private API functionalities
  ###

  observeDocumentForNewModules = ->
    return unless window?.MutationObserver?
    observer = new MutationObserver (records) ->
      for record in records
        do (record) ->
          if typeof record.addedNodes is "object"
            for node in record.addedNodes when node.nodeName is "IFRAME"
              if node.hasAttribute("data-module")
                attachToOnLoad(node)
    observer.observe(window.document, {childList: true, subtree: true})

  observeIframeContentSize = (element) ->
    observer = new element.contentWindow.MutationObserver ->
      resize(element)
    observer.observe(element.contentDocument.body, {childList: true, subtree: true})
    element

  attachToOnLoad = (element) ->
    showLoadIndicator(element) if element.hasAttribute(IFRAME_USE_LOAD_INDICATOR_ATTR)
    element.onload = ->
      Promise.delay(100).then ->
        observeIframeContentSize(element)
        hideLoadIndicator(element)
        resize(element)
        Promise.delay(500).then ->
          resize(element)

  generateLoadIndicatorElement = (element) ->
    loadIndicatorElement = window.document.createElement("DIV")
    loadIndicatorElement.setAttribute("data-module-load-indicator", "")
    loadIndicatorElement.innerHTML = LOAD_INDICATOR_TEMPLATE
    for bindableElement in loadIndicatorElement.querySelectorAll("[bind-module-name]")
      bindableElement.innerHTML = element.getAttribute(IFRAME_NAME_ATTR)
    loadIndicatorElement

  ###
  Public API functionalities
  ###

  findAll = (parent = null) ->
    unless parent then parent = window.document.body
    Array.prototype.slice.call(parent.querySelectorAll(IFRAME_SELECTOR))

  register = (element) ->
    attachToOnLoad(element)

  resize = (element) ->
    style = window.getComputedStyle(element.contentDocument.body, null)
    height = parseInt(style.getPropertyValue("padding-top")) + parseInt(style.getPropertyValue("padding-bottom"))
    height += child.offsetHeight for child in element.contentDocument.querySelectorAll("body > *:not(script):not(link):not(style)")
    element.style.height = "#{height}px"
    element

  showLoadIndicator = (element) ->
    element.style.display = "none"
    element.parentNode.insertBefore(generateLoadIndicatorElement(element), element.nextSibling)

  hideLoadIndicator = (element) ->
    if element.nextElementSibling?.hasAttribute("data-module-load-indicator")
      element.nextElementSibling.remove()
    element.style.display = "block"
    resize(element)

  setLoadIndicatorTemplate = (templateString) ->
    LOAD_INDICATOR_TEMPLATE = templateString

  return {
    findAll
    register
    resize
    showLoadIndicator
    hideLoadIndicator
  }