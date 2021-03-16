import Bird from "./bird";
import Level from "./level";

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }
  animate(level) {
    level.drawBackground(this.ctx);
    this.bird.animate(level);
  }
  restart(){
    this.level = new Level(this.dimensions);
    this.animate(this.level);
    this.bird = new Bird(this.dimensions);
  }
}
