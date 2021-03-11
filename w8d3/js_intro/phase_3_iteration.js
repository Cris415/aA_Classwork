Array.prototype.bubbleSort = function () {
    let isSorted = false;

    while (!isSorted) {
        isSorted = true;

        this.forEach((el, i ) => {
            if (this[i] > this[i+1]) {
                [this[i] , this[i+1]] = [this[i+1] , this[i]]
                isSorted = false
            }
        })
    }
   
}

String.prototype.substrings = function () {
    let subs = [];
    for ( let i =0; i<this.length; i++ ){
        for ( let j = i+1; j <= this.length; j++){
            subs.push(this.slice(i,j));
        }
    }
    return subs;
}