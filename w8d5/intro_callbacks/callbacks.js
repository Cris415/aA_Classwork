// const readline = require("readline");


class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    // 3. Call printTime.
    this.printTime(); 
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    console.log(this)
    if (this.seconds < 59) {
      this.seconds += 1;
    } else {
      this.minutes += 1;
      this.seconds = 0;
    }

    // 2. Call printTime.
    this.printTime();
  }
}

// const clock = new Clock();


// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout,
// });



function addNumbers(sum, numsLeft, completionCallback){
  if ( numsLeft === 0 ) {
    completionCallback(sum);
    reader.close();
  } else {
    reader.question("Enter a number: ", (number) => {
      sum += parseInt(number);
      console.log(sum);
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    });

  }
}

// addNumbers(0, 3, (sum) => console.log(`Total Sum: ${sum}`));
function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?: `, (ans) => {
    if (ans === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}



// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
    if ( i < arr.length - 1 ){
      askIfGreaterThan(arr[i], arr[i + 1], isGreaterThan => {       
        if ( isGreaterThan ){
          [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
          madeAnySwaps = true;
          innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        } else{
          innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        }
      });
    } else {
      outerBubbleSortLoop(madeAnySwaps);
    }


  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
}

// innerBubbleSortLoop([4, 3, 23, 7, 21], 0, false, () => {
//   console.log('in outer buublesort')
// })

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if ( madeAnySwaps === true ) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`. << reader.close();
  }
  outerBubbleSortLoop(true);
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

// absurdBubbleSort([3, 2, 1], function(arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });
// apply takes an array .apply(contex ,[args])
Function.prototype.myBind = function(context) {
  return () => { this.apply(context) }
}

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval){
  let tooSoon;

  return () => {
    if ( !tooSoon ){
      tooSoon = true
      
      setTimeout(() => {
        tooSoon = false
      }, interval)
      this();
    }
  }

}


// class Neuron {
//   fire() {
//     console.log("Firing!");
//   }
// }


// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

// You can use clearInterval to stop the firing:
// clearInterval(interval);

// Using Function#myThrottle, we should be able to throttle
// the #fire function of our neuron so that it can only fire
// once every 500ms:



// This time, if our Function#myThrottle worked correctly,
// the Neuron#fire function should only be able to execute
// every 500ms, even though we're still trying to invoke it
// every 10ms!

// If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// }

// const neuron = new Neuron();

// // neuron.fire = neuron.fire.myThrottle(500);

// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);



// ------------ Debounce ---------------



Function.prototype.myDebounce = function(interval){
  clearInterval()
   return () => {
       timer = setTimeout(this, interval);
       clearInterval(timer);
    }

}


class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

queryForHelloWorld();

searchBar.search = searchBar.search.myDebounce(500);