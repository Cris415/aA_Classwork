export default class Bird {
  constructor(dimensions){
    this.dimensions = dimensions;
    this.position = {height: position.height / 2, width: position.width / 3}
    this.velocity = 0;
  }

  drawBird(ctx){
    ctx.fillStyle = "yellow";
    ctx.fillRect(
      this.position.width,
      this.position.height,
      40, 30
    );
  }

  animate(level){
    drawBird(level);
  }

}