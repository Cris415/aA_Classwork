function sum1() {
    let sum = 0;
    for(let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}


function sum2() {
    let sum = 0;
    [...arguments].forEach(num => sum += num);
    return sum;
}

function sum3(num, ...args) {
    let sum = 0;
    args.forEach(num => sum += num);
    return sum;
}

//console.log(sum3(1, 2, 3, 4) === 9);
//console.log(sum3(1, 2, 3, 4, 5) === 14);



// myBind
Function.prototype.myBind1 = function(context) {
    // this -  says   context - Pavlov
    let args = [...arguments];
    args1 = args.slice(1);
    let that = this;
    return function() {
        let args2 = [...arguments];
        that.apply(context, [...args1, ...args2]);
    }
}

Function.prototype.myBind2 = function(...args1) {
  return (...args2) => {
    this.apply(args1[0], [...args1.slice(1), ...args2]);
  }
}


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

//markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind1(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind1(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind1(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind1(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

// curriedSum 

function curriedSum(numArgs) {
  const numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if(numbers.length === numArgs) {
      return numbers.reduce((acc, ele) => acc + ele);
    }else {
      return _curriedSum;
    }
  }
  return _curriedSum;
} 

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry1 = function(numArgs) {
  let args = [];
  let that = this;
  return function _curriedSum(arg) {
      args.push(arg);
      if(args.length === numArgs) {
        return that(...args);
      }else {
        return _curriedSum;
      }
  }
}
// const sumCurry = sum2.curry1(4);
// console.log(sumCurry(5)(30)(20)(1)); // => 56

Function.prototype.curry2 = function(numArgs) {
  let args = [];
  let that = this;
  return function _curriedSum(...arg) {
      args.push(...arg);
      if(args.length === numArgs) {
        return that(...args);
      }else {
        return _curriedSum;
      }
  }
}

Function.prototype.curry3 = function(numArgs) {
  let args = [];
  let that = this;
  return function _curried(...arg) {
      args.push(...arg);
      if(args.length === numArgs) {
        return that.apply(null, args);
      }else {
        return _curried;
      }
  }
}

const sumCurry = sum2.curry3(4);
console.log(sumCurry(5,30)(20)(1)); // => 56


