//start
boolean play;
BufferedReader reader;
String line;
ArrayList<Bloon> bloons =  new ArrayList<Bloon>();
ArrayList<Monkey> monkeys = new ArrayList<Monkey>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Timer> monkTimers = new ArrayList<Timer>();
ArrayList<RotateBloon> rotates = new ArrayList<RotateBloon>();
ArrayList<ArrayList<Tile>> tiles = new ArrayList<ArrayList<Tile>>();
ArrayList<Timer> timers = new ArrayList<Timer>();
int lives=50, money=650;
Timer tester= new Timer (10);
Sort sort = new Sort();


void setup() {
  size(850, 600);
  reader = createReader("map1.txt");
  bloons.add(new Bloon (0, 250, 5, 'r'));
  timers.add(new Timer(250));

  play = false;
  for (int k = 0; k<12; k++) {
    tiles.add(new ArrayList<Tile>());
    try {
      line = reader.readLine();
    }
    catch(IOException e ) {
      e.printStackTrace();
      line = null;
    }
    if (line ==null) {
      noLoop();
    } else {
      for (int l= 0; l<line.length(); l++) {

        tiles.get(k).add(new Tile(l*50, k*50, line.charAt(l), false));
      }
    }
  }
  rotates.add(new RotateBloon(200, 275, 'l'));
  rotates.add(new RotateBloon(175, 150, 'l'));
  rotates.add(new RotateBloon(50, 175, 'r'));
  rotates.add(new RotateBloon(70, 65, 'r'));
  rotates.add(new RotateBloon(340, 70, 'r'));
  rotates.add(new RotateBloon(330, 290, 'l'));
  rotates.add(new RotateBloon(430, 290, 'l'));
  rotates.add(new RotateBloon(430, 160, 'r'));
  rotates.add(new RotateBloon(540, 160, 'r'));
  rotates.add(new RotateBloon(540, 380, 'r'));
  rotates.add(new RotateBloon(165, 370, 'l'));
  rotates.add(new RotateBloon(165, 470, 'l'));
  rotates.add(new RotateBloon(240, 470, 'r'));
  rotates.add(new RotateBloon(240, 520, 'l'));
  rotates.add(new RotateBloon(690, 530, 'l'));
  rotates.add(new RotateBloon(690, 470, 'r'));
  rotates.add(new RotateBloon(735, 470, 'l'));
  rotates.add(new RotateBloon(728, 370, 'r'));
  rotates.add(new RotateBloon(795, 375, 'l'));
  rotates.add(new RotateBloon(795, 70, 'l'));
  rotates.add(new RotateBloon(580, 80, 'r'));
}
void draw() {

  background(0, 255, 0);
  //Determine if user is in gameplay
  if (!play) {
    startScreen();
  } else {
    if (mousePressed) {
      bloons.add(new Bloon (0, 250, 5, 'r'));
      timers.add(new Timer(250));
    }
    sort.heapSort(bloons, bloons.size());
    //map
    for (ArrayList<Tile> l : tiles) {
      for (Tile m : l) {
        m.display();
      }
    }



    //monkey
    for (int n=0; n<monkeys.size(); n++) {
      monkeys.get(n).display();

      for (int a=bloons.size()-1; a>=0; a--) {
        if (monkeys.get(n).bloonInRange(bloons.get(a))) {


          println("target switched");
          if (monkTimers.get(n).isFinished()) {
            projectiles.add(new Projectile(monkeys.get(n), bloons.get(a)));
            monkTimers.get(n).start();
          }
          break;
        }
      }
    }
    //darts
    for (int p=0; p<projectiles.size(); p++) {
      Projectile proj = projectiles.get(p);
      proj.move();
      proj.display();
      for (int d=0; d<bloons.size(); d++) {
        if (proj.bloonTouching(bloons.get(d))==true) {
          proj.pierce-=1;
          if (proj.pierce==0) {
            projectiles.remove(p);
            println("proj ran out of pierce!!!!!!!!!!!!!!");
          }
          bloons.get(d).hit(bloons.get(d).tier-proj.m.pdmg);
          bloons.get(d).tier-=proj.m.pdmg;
          money+=proj.m.pdmg;
          if (bloons.get(d).tier==0) {
            bloons.remove(d);
          }
        }
      }
      if (proj.reachedEnd()) {
        projectiles.remove(proj);
      }
    }

    //test

    for (RotateBloon rotate : rotates) {
      rotate.display();
    }

    //for (int test=0; test<10; test++) {
    //  if (tester.isFinished()) {
    //    bloons.add(new Bloon(0, 250, 5, 'r'));
    //    timers.add(new Timer(250));
    //    timers.get(test).start();
    //    tester.start(10000000);
    //  }
    //}
    //bloons
    for (int i = 0; i < bloons.size(); i++) {


      //Timer rotateCooldown=timers.get(i);

      Bloon bloon = bloons.get(i);
      for (int j =0; j<rotates.size(); j++) {
        RotateBloon rotate = rotates.get(j);
        if (rotate.bloonTouching(bloon)==true && timers.get(i).isFinished()) {
          timers.get(i).start(1000/bloon.speed);
          bloon.direction = rotate.rotate(bloon.direction);
        }
      }
      bloon.move();
      bloon.spawn();
      //println(bloon.x, bloon.y);

      if (bloon.reachedEnd()) {
        bloons.remove(bloon);
        lives-=bloon.tier;
        if (lives<0) {
          play=false;
        }
      }
    }
    fill(255);
    textSize(30);

    text(money, 30, 30);
    text(lives, 250, 30);
  }
}

//menuss
//game
void startScreen() {
  textAlign(CENTER);
  fill(255);
  textSize(46);
  text("Click Anywhere to Start", width/2, height/2-100);
  if (mousePressed) {
    play = true;
  }
}
void keyPressed() {
  if (play) {
    if (key =='z' ||key=='Z') {
      for (int l=0; l<tiles.size(); l++) {
        for (int m=0; m<tiles.get(l).size(); m++) {
          Tile tile = tiles.get(l).get(m);
          if (tile.hovering()==true&&tile.hasMonkey==false&&tile.type=='l'&& money>200) {
            money-=200;
            monkeys.add(new Monkey(tile.x+25, tile.y+25));
            monkTimers.add(new Timer (1000));
            monkTimers.get(monkTimers.size()-1).start();


            tile.hasMonkey=true;
          }
        }
      }
      //monkeys.add(new Monkey(mouseX, mouseY));
    }
  }
}
