(function() {
  var Hanoi = window.Hanoi = (window.Hanoi || {});

  // if (typeof Hanoi = "undefined") {
  //   window.Hanoi = {};
  // }

  var View = Hanoi.View = function(game, $el) {
    this.game = game;
    this.$el = $el;

    this.fromTowerIdx = null;
    this.$el.on("click", "ul", this.clickTower.bind(this));

    this.setupTowers();
    this.render();
  }

  View.NUM_COL = 3;
  View.NUM_DISK = 5;

  View.prototype.clickTower = function(event) {
    var clickedTowerIdx = $(event.currentTarget).index();

    if (this.fromTowerIdx == null) {
      this.fromTowerIdx = clickedTowerIdx;
    } else {
      if (!this.game.move(this.fromTowerIdx, clickedTowerIdx)){
        alert("Invalid move, please try again!");
      }

      this.fromTowerIdx = null;
    }

    this.render();

    if (this.game.isWon()) {
      alert("Congratulations, you won!");
      this.$el.off("click");
      this.$el.addClass("game-over");
    }
  };

  View.prototype.setupTowers = function() {
    this.$el.empty();
    this.$el.addClass("group");

    for (var towerIdx = 0; towerIdx < View.NUM_COL; towerIdx++) {
      var $tower = $("<ul>");

      for (var diskIdx = 0; diskIdx < View.NUM_DISK; diskIdx++) {
        var $disk = $("<li>");
        // $li.data("pos", [towerIdx, diskIdx]);
        $tower.append($disk);
      }

      this.$el.append($tower);
    }
  };

  View.prototype.render = function() {
    var $towers = this.$el.find("ul");
    $towers.removeClass();

    if (this.fromTowerIdx !== null) {
      $towers.eq(this.fromTowerIdx).addClass("selected");
    }

    this.game.towers.forEach(function(disks, towerIdx){
      var $disks = $towers.eq(towerIdx).children();
      $disks.removeClass();

      disks.forEach(function(diskWidth, diskIdx) {
        /*
        Since our disks are stacked from bottom to top
        as [3, 2, 1], we have to select from the back
        of our jQuery object, using negative indices.
        */
        $disks.eq(-1 * (diskIdx + 1)).addClass("disk-" + diskWidth);
      });
    });

  };

})();
