class window.HistoryEntryView extends Backbone.View

  className: "play"

  tagName: "tr"

  initialize: ->
    @render()

  render: ->
    
      
    td1 = $("<td class = 'dataRow'></td>")
    hand = @model.get("playerHand")
    hand.each (card) =>
      td1.append(new CardView(model: card).$el.addClass("smallCard"))

    td2 = $("<td class = 'dataRow'></td>")
    hand = @model.get("dealerHand")
    hand.each (card) =>
      td2.append(new CardView(model: card).$el.addClass("smallCard"))

    td3 = $("<td class = 'dataRow'></td>").text(@model.get("chipCount"))
    @$el.append(td1).append(td2).append(td3)