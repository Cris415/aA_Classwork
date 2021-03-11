Array.prototype.myEach = function (callback){
  for (let i = 0; i < this.length; i++){ 
    callback(this[i])
  }
}


Array.prototype.myMap = function (callback) {
  const newArr = [];
  for (let i = 0; i < this.length; i++) {
    newArr.push(callback(this[i]));
  }
  return newArr;
}


Array.prototype.myReduce = function (callback, initial) {

  let acc = initial;
  if (initial === undefined ) {
    acc = this[0]
    this.slice(1).myEach(function (el) {
      acc = callback(acc, el);
    });
  } else {
    this.myEach(function (el) {
      acc = callback(acc, el);
    });
  }
  
  return acc
} 
