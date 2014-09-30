$ = require 'jquery'
_ = require 'underscore'
window.hljs = hljs = require('highlight.js')

class Woo
  menuPreviewTolerance: 150

  constructor: ->
    hljs.initHighlighting()

    @setupEvents()
    @bindWidthPickers()
    @activateCodeShowing()

  openMenu: =>
    $('body').addClass('open')
    clearTimeout(@delayedClose) if @delayedClose

  closeMenuEventually: =>
    @delayedClose = _.delay(@closeMenu, 300)

  closeMenu: ->
    $('body').removeClass('open')

  bindWidthPickers: ->
    $('a[data-width]').click ->
      $('dd.preview').css('width', $(this).data('width'))
      $(this).siblings().removeClass('selected')
      $(this).addClass('selected')

  activateCodeShowing: ->
    $('div.location').click ->
      $(this).toggleClass('show-code')

  setupEvents: ->
    $('body').on('mouseleave', 'nav', @closeMenuEventually)
    $('body').on('mouseover', 'nav', @openMenu)

    $('body nav').on('click', '.menu', @closeMenu)

    $('nav .nav-item-list [href]').on('click', @closeMenu)

    $('body').on 'mousemove', (e) =>
      if e.pageX <= @menuPreviewTolerance
        $('body nav').addClass('near-menu')
      else
        $('body nav').removeClass('near-menu')

    $('nav .nav-item').on 'click', (e) ->
      $('nav .nav-item').removeClass('open')
      $(this).toggleClass('open')

$ -> new Woo()
