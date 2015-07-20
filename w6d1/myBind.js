Function.prototype.myBind = function (context) {
  var fn = this;

  // arguments will be reset, so we need to save it. We also lop off
  // the initial context argument.
  var bindTimeArgs = Array.prototype.slice.call(arguments, 1);
  console.log(bindTimeArgs);

  return function () {
    var callTimeArgs = Array.prototype.slice.call(arguments);

    console.log('-------');
    console.log(callTimeArgs);

    return fn.apply(context, bindTimeArgs.concat(callTimeArgs));
  };
};

function Cat(name) {
  this.name = name;
};

Cat.prototype.says = function (sound) {
  console.log(this.name + " says " + sound + "!");
}

var markov = new Cat("Markov");
var breakfast = new Cat("Breakfast");

markov.says("meow");
// Markov says meow!

// markov.says.myBind(breakfast, "meow")();
// Breakfast says meow!

// markov.says.myBind(breakfast)("meow");
// Breakfast says meow!

var notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow");
// Breakfast says meow!
