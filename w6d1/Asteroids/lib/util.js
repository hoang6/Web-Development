(function() {
  if (typeof Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  var Util = Asteroids.Util = {};

  //Why we dont need to use prototype here?
  var dist = Util.dist = function(pos1, pos2) {
    return Math.sqrt(
      Math.pow(pos1[0] - pos2[0], 2), Math.pow(pos1[1] - pos2[1], 2)
    );
  };
  //
  var norm = Util.norm = function(vect) {
    return Util.dist([0, 0], vect);
  };

  // var randomVec = Util.randomVec = function(length) {
  //   var deg = 2 * Math.PI + Math.random();
  //
  //   return [Math.sin(deg) * length, Math.cos(deg) * length];
  // };

  // // Return a randomly oriented vector with the given length.
  var randomVec = Util.randomVec = function (length) {
    var deg = 2 * Math.PI * Math.random();
    // return [Math.sin(deg) * length, Math.cos(deg) * length];

    return scale([Math.sin(deg), Math.cos(deg)], length);
  };

  // Scale the length of a vector by the given amount.
  var scale = Util.scale = function (vec, m) {
    return [vec[0] * m, vec[1] * m];
  };

  var inherits = Util.inherits = function(ChildClass, BaseClass) {
    // function Surrogate() {};
    function Surrogate () { this.constructor = ChildClass };
    Surrogate.prototype = BaseClass.prototype;
    ChildClass.prototype = new Surrogate();
  };

})();
