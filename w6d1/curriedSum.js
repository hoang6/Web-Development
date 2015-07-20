function curriedSum(numArgs) {
  var numbers = [];

  function _curriedSum(number) {
    numbers.push(number);

    if (numbers.length === numArgs) {
      var sum = 0;

      numbers.forEach(function(number) {
        sum += number;
      });

      return sum;
    } else {
      return _curriedSum(number);
    }
  }

  return _curriedSum;
};

Function.prototype.curry = function(numArgs) {
  var fn = this;
  var args = [];

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFn;
    }
  }

  return _curriedFn;
};
