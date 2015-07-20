(function() {
  if (typeof Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  var Game = Asteroids.Game = function() {
    this.asteroids = [];

    this.addAsteroids();
  };

  Game.BG_COLOR = "#eaeaea";
  Game.DIM_X = 1000;
  Game.DIM_Y = 600;
  Game.NUM_ASTEROIDS = 5;
  Game.FPS = 24;

  Game.prototype.addAsteroids = function() {
    for (var num = 0; num < Game.NUM_ASTEROIDS; num++) {
      this.asteroids.push(new Asteroids.Asteroid({game: this}));
    }
  };


  // Game.prototype.add = function (object) {
  //   if (object instanceof Asteroids.Asteroid) {
  //     this.asteroids.push(object);
  //   } else if (object instanceof Asteroids.Bullet) {
  //     this.bullets.push(object);
  //   } else if (object instanceof Asteroids.Ship) {
  //     this.ships.push(object);
  //   } else {
  //     throw "wtf?";
  //   }
  // };
  //
  // Game.prototype.addAsteroids = function () {
  //   for (var i = 0; i < Game.NUM_ASTEROIDS; i++) {
  //     this.add(new Asteroids.Asteroid({ game: this }));
  //   }
  // };


  Game.prototype.randomPosition = function() {
    return [
      Game.DIM_X * Math.random(),
      Game.DIM_Y * Math.random()
    ];
  };

  Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    ctx.fillStyle = Game.BG_COLOR;
    ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);

    this.asteroids.forEach(function(asteroid) {
      asteroid.draw(ctx);
    });
  };

  Game.prototype.moveObjects = function(asteroid) {
    this.asteroids.forEach(function(asteroid) {
      asteroid.move();
    });
  };

  Game.prototype.wrap = function(pos) {

    pos[0] = wrap(pos[0], Game.DIM_X);
    pos[1] = wrap(pos[1], Game.DIM_Y);

    return pos;

    function wrap(coord, max) {
      if (coord < 0) {
        return max - (coord % max);
      } else if (coord > max) {
        return coord % max;
      } else {
        return coord;
      }
    }

  };

  Game.prototype.checkCollisions = function() {
    for (var i = 0; i < (this.asteroids.length - 1); i++) {
      for (var j = i + 1; j < this.asteroids.length; j++) {
        if (this.asteroids[i].isCollidedWith(this.asteroids[j]))
          // alert('COLLISION');
          this.asteroids[i].collideWith(this.asteroids[j]);
      }
    }

    // var game = this;
    //
    // this.asteroids.forEach(function(obj1) {
    //   game.asteroids.forEach(function(obj2) {
    //     if (obj1 === obj2) {
    //       return;
    //     }
    //
    //     if (obj1.isCollidedWith(obj2)) {
    //       obj1.collideWith(obj2);
    //     }
    //   });
    // });
  };

  Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
  };

  Game.prototype.remove = function(asteroid) {
    this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);
  };

})();
