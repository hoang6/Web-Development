(function () {
  // Make a namespace `Assessment`.
  if(typeof Assessment === "undefined") {
    window.Assessment = {};
  }

  // write mergeSort(array)
  Assessment.mergeSort = function mergeSort (array) {
    if (array.length <= 1) {
      return array;
    }

    // Slice actually takes floors automatically, but this is more
    // explicit.
    var middle = Math.floor(array.length / 2);
    var left = array.slice(0, middle);
    var right = array.slice(middle);

    return merge(mergeSort(left), mergeSort(right));
  };

  // Note that merge isn't published into the Assessment namespace
  function merge (left, right) {
    var result = [];

    var leftIdx = 0, rightIdx = 0;
    while ((leftIdx < left.length) || (rightIdx < right.length)) {
      if ((rightIdx === right.length) || (left[leftIdx] < right[rightIdx])) {
        result.push(left[leftIdx]);
        leftIdx++;
      } else {
        result.push(right[rightIdx]);
        rightIdx++;
      }
    }

    return result;
  };

  // write recursiveExponent(base, power)
  Assessment.recursiveExponent = function recursiveExponent (base, power) {
    if (power === 1) {
      return base;
    }

    return base * recursiveExponent(base, power - 1);
  };

  // write transpose(matrix)
  Assessment.transpose = function transpose (matrix) {
    var columns = [];

    var i;
    for (i = 0; i < matrix[0].length; i++) {
      columns.push([]);
    }

    var j;
    for (i = 0; i < matrix.length; i++) {
      for (j = 0; j < matrix[i].length; j++) {
        columns[j].push(matrix[i][j]);
      }
    }

    return columns;
  };

  // write primes(n)
  Assessment.primes = function primes (n) {
    var primeArr = [];
    var i = 1;

    while (primeArr.length < n) {
      i++;
      if (isPrime(i)) {
        primeArr.push(i);
      }
    }

    return primeArr;
  };

  function isPrime (n) {
    var i;
    for (i = 2; i < n; i++) {
      if (n % i === 0) {
        return false;
      }
    }

    return true;
  };

  // write myBind(context)
  Function.prototype.myBind = function myBind (context) {
    var fn = this;
    var bindArgs = Array.prototype.slice.call(arguments, 1);
    return function () {
      var callArgs = Array.prototype.slice.call(arguments);
      return fn.apply(context, bindArgs.concat(callArgs));
    };
  };

  // write inherits(ParentClass)
  Function.prototype.inherits = function inherits (ParentClass) {
    function Surrogate () {};
    Surrogate.prototype = ParentClass.prototype;
    this.prototype = new Surrogate();

    // This part is an unnecessary nice-to-have. `gizmo.constructor =>
    // Cat` is JavaScript's way of writing Ruby's `gizmo.class`. You
    // won't be tested on the constructor property.
    this.prototype.constructor = this;
  };
})();
