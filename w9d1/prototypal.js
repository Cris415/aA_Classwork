Function.prototype.inherits1 = function(parentClass){
  function Surrogate(){};
  Surrogate.prototype = parentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

Function.prototype.inherits2 = function (parentClass) {
  this.prototype = Object.create(parentClass.prototype);
  this.prototype.constructor = this;
};

function MovingObject(speed) {
  this.speed = speed;
};

MovingObject.prototype.rotate = function(){
  console.log(`rotates at ${this.speed}`);
}

function Ship(speed) {
  MovingObject.call(this, speed);
}

Ship.inherits2(MovingObject);

function Asteroid(speed) {
  MovingObject.call(this, speed);
}
Asteroid.inherits2(MovingObject);

const ship = new Ship("50");
const asteroid = new Asteroid("4");

ship.rotate();
asteroid.rotate();