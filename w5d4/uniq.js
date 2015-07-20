Array.prototype.uniq = function() {
  var uniqArr = [];
  for (var i = 0; i < this.length; i++) {
    if (uniqArr.indexOf(this[i]) === -1) {
      uniqArr.push(this[i]);
    }
  }
  return uniqArr;
}
// console.log([1, 1, 1, 3, 4, 2, 5].uniq());

Array.prototype.two_sum = function() {
  var number_pairs = [];
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = (i + 1); j < this.length; j++) {
      if (this[i] + this[j] === 0)
      number_pairs.push([i, j]);
    }
  }

  return number_pairs;
};
console.log([-1, 0, 2, -2, 1].two_sum());

Array.prototype.transpose = function() {
  var rows = this.length;
  var cols = this[0].length;
  // var trans_matrix = new Array(cols, rows);
  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < cols; j++) {
      trans_matrix[j][i] = this[i][j];
    }
  }

  return trans_matrix;
};
console.log([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ].transpose());
