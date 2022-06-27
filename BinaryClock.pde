int br = 50;
int bg_color = #28262C;
int on_color = #087E8B;
int off_color = #F4EBE8;
int text_color = #F4EBE8;
int s,m,h;
int sd = 10;
int cw, ch;
String sb, mb, hb;
boolean draw_helper = false;

void setup() {
  size (1000,1000);
  //frameRate(1);
}

void draw() {
  background(bg_color);
  s = second();
  m = minute();
  h = hour();

  ch = height/2;
  sb = binary(s);
  mb = binary(m);
  hb = binary(h);

  int[] time = new int[3];
  time[0] = h;
  time[1] = m;
  time[2] = s;
  
  for (int i = 0; i <= 2; i++) {
    noStroke();
    cw = width/2 + width*((i-1)*2)/sd;
    
    int t_10_i = (time[i]/10) % 10;
    int t_1_i = time[i] % 10;
    String t_10 = binary(t_10_i, 3);
    String t_1 = binary(t_1_i, 4);
    
    if (t_10.charAt(0) == '0') {
      fill(off_color);
      circle(cw - width/sd/2, ch - 1*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw - width/sd/2, ch - 1*height/sd/2, br);
    }
      
    if (t_10.charAt(1) == '0') {
      fill(off_color);
      circle(cw - width/sd/2, ch + 1*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw - width/sd/2, ch + 1*height/sd/2, br);
    }
    
    if (t_10.charAt(2) == '0') {
      fill(off_color);
      circle(cw - width/sd/2, ch + 3*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw - width/sd/2, ch + 3*height/sd/2, br);
    }
    
    //------
    if (t_1.charAt(0) == '0') {
      fill(off_color);
      circle(cw + width/sd/2, ch - 3*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw + width/sd/2, ch - 3*height/sd/2, br);
    }
      
    if (t_1.charAt(1) == '0') {
      fill(off_color);
      circle(cw + width/sd/2, ch - 1*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw + width/sd/2, ch - 1*height/sd/2, br);
    }
    
    if (t_1.charAt(2) == '0') {
      fill(off_color);
      circle(cw + width/sd/2, ch + 1*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw + width/sd/2, ch + 1*height/sd/2, br);
    }
   
    if (t_1.charAt(3) == '0') {
      fill(off_color);
      circle(cw + width/sd/2, ch + 3*height/sd/2, br);
    } else {
      fill(on_color);
      circle(cw + width/sd/2, ch + 3*height/sd/2, br);
    }
    
    //-----
    if (draw_helper) {
      fill(text_color);
      textSize(50);
      text(t_10_i, cw - width/sd/2, ch + 5.5*height/sd/2);
      text(t_1_i, cw + width/sd/2, ch + 5.5*height/sd/2);
    }
    
  }
  if (draw_helper) {
    fill(text_color);
    textSize(100);
    text(h + ":" + m + ":" + s, width/2, 200);
    textAlign(CENTER);
    textSize(50);
    text("1", width/2 - 3.5*width/sd, ch + 3.3*height/sd/2);
    text("2", width/2 - 3.5*width/sd, ch + 1.3*height/sd/2);
    text("4", width/2 - 3.5*width/sd, ch - 0.7*height/sd/2);
    text("8", width/2 - 3.5*width/sd, ch - 2.7*height/sd/2);
    stroke(text_color);
    line(200, ch + 4.3*height/sd/2, 800, ch + 4.3*height/sd/2);
    for (int i = -2; i <= 2; i++) {
      line(width/2 + i*width/sd, ch - 3.7*height/sd/2, width/2 + i*width/sd, ch + 5.8*height/sd/2);
    }
  }
  
}

void mouseClicked() {
  draw_helper = !draw_helper;
}
