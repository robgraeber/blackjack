class window.HistoryEntryView extends Backbone.View

  className: "play"

  tagName: "tr"

  initialize: ->
    @render()

  render: ->
 
    hand = @model.get("playerHand")
    td1 = $("<td class = 'dataRow'></td>")
    hand.each (card) ->
      td1.html(td1.html() + card.get("suitName") + " - " + card.get("rankName") + "<br/>")

    hand = @model.get("dealerHand")
    td2 = $("<td class = 'dataRow'></td>")
    hand.each (card) ->
      td2.html(td2.html() + card.get("suitName") + " - " + card.get("rankName") + "<br/>")

    td3 = $("<td class = 'dataRow'></td>").text(@model.get("chipCount"))
    @$el.append(td1).append(td2).append(td3)