final int BIT_SIZE = 50;
final int BG_COLOR = #28262C;
final int ON_COLOR = #087E8B;
final int OFF_COLOR = #F4EBE8;
int text_color = #F4EBE8;
int s,m,h;
int sd = 10;
int center_x, center_y;
String sb, mb, hb;
boolean draw_helper = false;

void setup() {
  size (1000,1000);
  pixelDensity(displayDensity());
  textAlign(CENTER);
}

void draw() {
  background(BG_COLOR);
  s = second();
  m = minute();
  h = hour();

  center_y = height/2;
  sb = binary(s);
  mb = binary(m);
  hb = binary(h);

  int[] time = new int[3];
  time[0] = h;
  time[1] = m;
  time[2] = s;
  
  for (int i = 0; i <= 2; i++) {
    noStroke();
    center_x = width/2 + width*((i-1)*2)/sd;
    
    int t_10_i = (time[i]/10) % 10;
    int t_1_i = time[i] % 10;
    String t_10 = binary(t_10_i, 3);
    String t_1 = binary(t_1_i, 4);
    int fill_color;
    
    // ----- 10's Place ------
    for (int j = 0; j < t_10.length(); j++) {
      fill_color = (t_10.charAt(j) == '0') ? OFF_COLOR : ON_COLOR;
      fill(fill_color);
      int offset_y = (j * 2) - 1;
      circle(center_x - width/sd/2, center_y + offset_y*height/sd/2, BIT_SIZE);
    }
    
    // ----- 1's Place ------
    for (int j = 0; j < t_1.length(); j++) {
      fill_color = (t_1.charAt(j) == '0') ? OFF_COLOR : ON_COLOR;
      fill(fill_color);
      int offset_y = (j * 2) - 3;
      circle(center_x + width/sd/2, center_y + offset_y*height/sd/2, BIT_SIZE);
    }
    
    //-----
    if (draw_helper) {
      fill(text_color);
      textSize(50);
      text(t_10_i, center_x - width/sd/2, center_y + 5.5*height/sd/2);
      text(t_1_i, center_x + width/sd/2, center_y + 5.5*height/sd/2);
    }
    
  }
  if (draw_helper) {
    fill(text_color);
    textSize(100);
    text(h + ":" + m + ":" + s, width/2, height/4);
    textSize(50);
    text("1", width/2 - 3.5*width/sd, center_y + 3.3*height/sd/2);
    text("2", width/2 - 3.5*width/sd, center_y + 1.3*height/sd/2);
    text("4", width/2 - 3.5*width/sd, center_y - 0.7*height/sd/2);
    text("8", width/2 - 3.5*width/sd, center_y - 2.7*height/sd/2);
    stroke(text_color);
    line(200, center_y + 4.3*height/sd/2, 800, center_y + 4.3*height/sd/2);
    for (int i = -2; i <= 2; i++) {
      line(width/2 + i*width/sd, center_y - 3.7*height/sd/2, width/2 + i*width/sd, center_y + 5.8*height/sd/2);
    }
  }
  
}

void mouseClicked() {
  draw_helper = !draw_helper;
}
