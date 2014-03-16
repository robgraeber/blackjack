class window.CardView extends Backbone.View

  className: 'card'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    if @model.get "revealed"
      cardId = "card-"+@model.translateValue()
    else
      cardId = "card-back"

    template = document.getElementById(cardId).innerHTML;
    # Mustache.escapeHtml = function (text) { return text.replace(/\"/g, '\\"'; }
    output = Mustache.render template, 
      suit:
        symbol: @model.translate(@model.get('suitName'))
        name:@model.get('suitName').toLowerCase()

    @$el.children().detach().end().html
    @$el.html output
    @$el.addClass(@model.get("suitName").toLowerCase())
