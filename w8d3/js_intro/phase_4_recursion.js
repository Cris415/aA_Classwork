function range(start, end) {
    if (start === end){
    return [];}

    let output=range(start, end-1);
    output.push(end-1);
    return output;

}

function sumRec(arr){
    if(arr.length === 0){
        return 0
    };

    return sumRec(arr)
}