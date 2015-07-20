var Cat = function(name, owner) {
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function() {
  return(this.owner + ' loves ' + this.name);
};

var tom = new Cat('tom', 'tuan');
var jerry = new Cat('jerry', 'tuan');
console.log(tom.cuteStatement());
console.log(jerry.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return('Everyone loves ' + this.name + '!');
};

console.log(tom.cuteStatement());
console.log(jerry.cuteStatement());

Cat.prototype.meow = function() {
  return('Meow');
};

console.log(tom.meow());
console.log(jerry.meow());

tom.meow = function() {
  return('Meow');
};

console.log(tom.meow());
console.log(jerry.meow());
