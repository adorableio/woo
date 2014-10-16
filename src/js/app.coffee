$ = require 'jquery'
_ = require 'underscore'
window.hljs = hljs = require('highlight.js')

class Woo
  menuPreviewTolerance: 150
  menuOpenTolerance: 10
  previousMousePosition: {}

  constructor: ->
    hljs.initHighlighting()

    @setupEvents()
    @bindWidthPickers()
    @activateCodeShowing()
    @executeColorTransmogrification()
    @_maybeOpen = _.debounce(@maybeOpen, 10, true)
    @_maybePreview = _.debounce(@maybePreview, 10, true)

  openMenu: =>
    $('body').addClass('open')
    $('body nav .menu').addClass('close')
    clearTimeout(@delayedClose) if @delayedClose

  maybeOpen: (mousePosition) =>
    if mousePosition.x < @previousMousePosition.x &&
    mousePosition.x <= @menuOpenTolerance
      @openMenu()

  maybePreview: (mousePosition) =>
    if mousePosition.x < @previousMousePosition.x &&
    mousePosition.x <= @menuPreviewTolerance
      $('body nav').addClass('near-menu')
    else if mousePosition.x >= @menuPreviewTolerance
      $('body nav').removeClass('near-menu')

  closeMenuEventually: =>
    @delayedClose = _.delay(@closeMenu, 300)

  closeMenu: (e) ->
    $('body').removeClass('open')
    $('body nav .menu').removeClass('close')

  bindWidthPickers: ->
    $('a[data-width]').click ->
      $('dd.preview').css('width', $(this).data('width'))
      $(this).siblings().removeClass('selected')
      $(this).addClass('selected')

  activateCodeShowing: ->
    $('div.location').click ->
      $(this).toggleClass('show-code')

  executeColorTransmogrification: ->
    previewColor = $('body').css('background-color')
    $('dd.preview').css('background-color': previewColor)

  setupEvents: ->
    notSelectors = 'nav, .menu, .nav-item, .nav-item-title, .nav-item-icon'
    $("body #woo-styleguide :not(#{notSelectors})").on('click', @closeMenu)

    $('body nav').on('click', '.menu', @openMenu)
    $('body nav').on('click', '.close', @closeMenu)

    $('body').on 'mouseleave', => @previousMousePosition.x = 0

    $('body').on 'mousemove', (e) =>
      mousePosition = {x: e.pageX}
      @_maybeOpen(mousePosition)
      @_maybePreview(mousePosition)
      @previousMousePosition = mousePosition

    $('nav .nav-item').on 'click', '.nav-item-title, .nav-item-icon', @openNavItem

  openNavItem: (e) ->
    $('nav .nav-item').removeClass('open')
    $(this).parent().toggleClass('open')

$ -> new Woo()
