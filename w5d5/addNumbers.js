var readLine = require('readline');
var reader = readLine.createInterface({
  input: process.stdin,
  output: process.stdout
});

var sum = 0;
function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Enter number: ', function(numString) {
      var num = parseInt(numString);

      sum += num;
      console.log('Partial sum is: ' + sum);

      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    })

  } else {
    completionCallback(sum);
  }
};

addNumbers(0, 3, function(sum) {
  console.log('Total sum: ' + sum);
  reader.close();
});
