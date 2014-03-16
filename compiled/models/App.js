// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.App = (function(_super) {
    __extends(App, _super);

    function App() {
      this.dealerPlayCard = __bind(this.dealerPlayCard, this);
      _ref = App.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    App.prototype.initialize = function() {
      this.set('history', new History());
      this.set("playerChips", 20000);
      this.set('deck', new Deck());
      return this.dealNewHand();
    };

    App.prototype.dealerReveal = function() {
      this.get("dealerHand").at(0).set("revealed", true);
      return setTimeout(this.dealerPlayCard, 1000);
    };

    App.prototype.dealerPlayCard = function() {
      var _this = this;
      if (this.get("dealerHand").scores()[0] < 17) {
        this.get("dealerHand").hit();
      }
      if (this.get("dealerHand").scores()[0] < 17) {
        setTimeout(this.dealerPlayCard, 1000);
      } else if (this.get("dealerHand").scores()[0] > 21) {
        this.playerWin(true);
      } else {
        if (this.get("dealerHand").scores()[0] > this.get("playerHand").scores()[0]) {
          this.playerWin(false);
        } else if (this.get("dealerHand").scores()[0] < this.get("playerHand").scores()[0]) {
          this.playerWin(true);
        } else {
          console.log("game draw");
        }
      }
      return setTimeout(function() {
        return _this.restartGame();
      }, 1000);
    };

    App.prototype.playerWin = function(isTrue) {
      if (isTrue) {
        console.log("player wins!");
        return this.set("playerChips", this.get("playerChips") + 1000);
      } else {
        console.log("dealer wins!");
        return this.set("playerChips", this.get("playerChips") - 1000);
      }
    };

    App.prototype.dealNewHand = function() {
      var _this = this;
      console.log("Player chips: ", this.get("playerChips"));
      this.set('playerHand', this.get("deck").dealPlayer());
      this.set('dealerHand', this.get("deck").dealDealer());
      return this.get('playerHand').on('add remove change', function() {
        if (_this.get("playerHand").scores()[0] > 21) {
          _this.playerWin(false);
          _this.trigger("playerLose", _this);
          return setTimeout(function() {
            return _this.restartGame();
          }, 500);
        }
      });
    };

    App.prototype.restartGame = function() {
      var play;
      play = new Play({
        playerHand: this.get("playerHand"),
        dealerHand: this.get("dealerHand"),
        chipCount: this.get("playerChips")
      });
      this.get("history").add(play);
      console.log(this.get("history"));
      console.log("restarting game");
      this.set('deck', new Deck());
      return this.dealNewHand();
    };

    return App;

  })(Backbone.Model);

}).call(this);

/*
//@ sourceMappingURL=App.map
*/
