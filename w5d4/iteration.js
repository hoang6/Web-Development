Array.prototype.bubbleSort = function() {
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] > this[j]) {
        var tmp = this[i];
        this[i] = this[j];
        this[j] = tmp;
      }
    }
  }

  return this;
};

console.log([5, 3, 4, 2, 1].bubbleSort());

String.prototype.subStrings = function() {
  var substrings = [];

  for (var start = 0; start < this.length; start++) {
    for (var len = 1; (start + len) <= this.length; len++) {
      if (substrings.indexOf(this.slice(start, start + len)) === -1)
        substrings.push(this.slice(start, start + len));
    }
  }

  return substrings;
};

console.log('cat'.subStrings());
