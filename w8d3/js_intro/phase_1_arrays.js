
Array.prototype.uniq = function () {
  let newArr = [];
  // for (let i = 0; i < this.length; i++) {
  //   if (!newArr.includes(this[i])) {
  //     newArr.push(this[i]);
  //   }
  // }

  this.forEach(el => {
   if (!newArr.includes(el)) {
      newArr.push(el);
    }
  });

  return newArr;
}

Array.prototype.twoSum = function () { 
  const newArr = []
  for (let i = 0; i < this.length; i++){
      for (let j = i + 1; j < this.length; j++) {
        if (this[i] + this[j] === 0){
          newArr.push([i,j])
        }
      }
  }

  return newArr;
}

Array.prototype.transpose = function () {
  const transposed = []

  for (let l = 0; l < this.length; l++){
    transposed.push(new Array)
  }

  for (let i = 0; i < this.length; i++){
    for (let j = 0; j < this[i].length; j++) {
      transposed[j][i] = this[i][j]
    }
  }

  return transposed
}
