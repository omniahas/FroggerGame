// Enemies our player must avoid
var Enemy = function(x, y) {
  this.x= x;
  this.y= y;
  this.sprite = 'images/enemy-bug.png';
  this.speed = Math.floor((Math.random() * 200) + 100);
    // Variables applied to each of our instances go here,
    // we've provided one for you to get started
    // The image/sprite for our enemies, this uses
    // a helper we've provided to easily load images

};

// Update the enemy's position, required method for game
// Parameter: dt, a time delta between ticks
Enemy.prototype.update = function(dt) {
if(this.x <= 550){
  this.x+= this.speed*dt;
    }else{
      this.x = -2;
    }
    // You should multiply any movement by the dt parameter
    // which will ensure the game runs at the same speed for
    // all computers.

};

// Draw the enemy on the screen, required method for game
Enemy.prototype.render = function() {
    ctx.drawImage(Resources.get(this.sprite), this.x, this.y);
};

var Player = function(){
this.sprite = 'images/char-boy.png';
this.x = 200;
this.y=400;
this.score = 0;
};

Player.prototype.update = function() {
  this.x = 200;
  this.y=400;
  this.score = this.score + 1;

}

var Girl = function(x,y){
  this.sprite = 'images/char-horn-girl.png';
  this.x = 200;
  this.y=400;
}
Girl.prototype.render = function() {
  ctx.drawImage(Resources.get(this.sprite), this.x, this.y);
};




Player.prototype.render = function() {
  ctx.drawImage(Resources.get(this.sprite), this.x, this.y);
};
Player.prototype.handleInput = function(e){
  if(this.ctlKey === 'left'){
    if (this.x >0){
        this.x = this.x - 50;
    }

  //if right key is pressed and player is not on edge of map increment x
  }else if(this.ctlKey === 'right' ){
    if (this.x != 400){
        this.x = this.x + 50;
    }

  //if up key is pressed increment y
  }else if(this.ctlKey === 'up'){
    if (this.y > 0){
        this.y = this.y - 50;
    }

  //if down key is pressed and player is not on edge of map decrement y
  }else if (this.ctlKey === 'down'){
    if (this.y != 400){
        this.y = this.y + 50;
    }

  }
  this.ctlKey = null;

  //If on water, reset
  if(this.y < 26){
      this.reset();
  }


};
Object.prototype.reset = function(){
  player.x = 200;
  player.y = 400;
  this.score = 0;

};

// Now write your own player class
// This class requires an update(), render() and
// a handleInput() method.


// Now instantiate your objects.
// Place all enemy objects in an array called allEnemies
// Place the player object in a variable called player
var allEnemies = [];
var moon = new Enemy(-2, 70);
var Taiba = new Enemy(-2,50);
var Mac = new Enemy(-2,180);
var Sos = new Enemy(-2,220);
var allEnemies = [moon, Taiba, Mac, Sos];
var player = new Player();




// This listens for key presses and sends the keys to your
// Player.handleInput() method. You don't need to modify this.
document.addEventListener('keyup', function(e) {
    var allowedKeys = {
        37: 'left',
        38: 'up',
        39: 'right',
        40: 'down'
    };

    player.handleInput(allowedKeys[e.keyCode]);
});
