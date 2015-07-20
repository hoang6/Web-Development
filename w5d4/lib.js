function sayHello(name) {
  console.log("Hello " + name);
}

function sayHelloThreeTimes(name) {
  for (var i = 0; i < 3; i++) {
      sayHello(name);
  }
}

console.log(sayHello("Tuan"));
console.log(sayHelloThreeTimes("Nou"));
