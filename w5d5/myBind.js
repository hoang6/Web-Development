Function.prototype.myBind = function(context) {
  var fn = this;
  return function() {
    return fn.apply(context);
  };
};

var Cat = function(name){
  this.name = name;
}

var Dog = function(name) {
  this.name = name;
};

Cat.prototype.meow = function() {
  console.log(this.name + ' says meow!');
};

var tom = new Cat('Tom');
var rot = new Dog('Rot');

// tom.meow();
setTimeout(tom.meow.myBind(rot), 1000)
