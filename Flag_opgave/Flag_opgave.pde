String[][] groups = {
  {"RUSSIA", "SAUDI ARABIA", "EGYPT", "URUGUAY"},
  {"PORTUGAL", "SPAIN", "MOROCCO", "IRAN"},
  {"FRANCE", "AUSTRALIA", "PERU", "DENMARK"},
  {"ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"}
};

String[] groupNames = {"GROUP A", "GROUP B", "GROUP C", "GROUP D"};

color teal   = color(0, 200, 200);
color yellow = color(255, 220, 0);

int colW, rowH;
int lineH = 50;
int boxH  = 40;
int pad   = 10;
int flagH = 28;
int flagW = 42;
int barW  = 12;

HashMap<String, PImage> flags = new HashMap<String, PImage>();
HashMap<String, String> fileMap = new HashMap<String, String>();

void setup() {
  size(700, 500);
  textFont(createFont("Arial Bold", 18));
  textAlign(LEFT, CENTER);
  noStroke();
  colW = width/2;
  rowH = height/2;

  fileMap.put("RUSSIA", "russia.png");
  fileMap.put("SAUDI ARABIA", "saudi.png");
  fileMap.put("EGYPT", "egypt.png");
  fileMap.put("URUGUAY", "uruguay.png");
  fileMap.put("PORTUGAL", "portugal.png");
  fileMap.put("SPAIN", "spain.png");
  fileMap.put("MOROCCO", "morocco.png");
  fileMap.put("IRAN", "iran.png");
  fileMap.put("FRANCE", "france.png");
  fileMap.put("AUSTRALIA", "australia.png");
  fileMap.put("PERU", "peru.png");
  fileMap.put("DENMARK", "denmark.png");
  fileMap.put("ARGENTINA", "argentina.png");
  fileMap.put("ICELAND", "iceland.png");
  fileMap.put("CROATIA", "croatia.png");
  fileMap.put("NIGERIA", "nigeria.png");
}

void draw() {
  background(20, 40, 80);

  int[] order = {0, 2, 1, 3};

  for (int pos = 0; pos < order.length; pos++) {
    int g = order[pos];
    int gx = (pos % 2) * colW;
    int gy = (pos / 2) * rowH;

    fill(10, 30, 60);
    rect(gx+10, gy+10, colW-20, 30);

    color groupColor = (gy == 0) ? yellow : teal;
    fill(groupColor);
    text(groupNames[g], gx+20, gy+25);

    for (int i = 0; i < groups[g].length; i++) {
      int yTop = gy + 50 + i*lineH;

      fill(255);
      rect(gx+10, yTop, colW-20, boxH);

      fill(groupColor);
      rect(gx+10 + (colW-20) - barW, yTop, barW, boxH);

      String country = groups[g][i];
      PImage img = getFlag(country);
      int fy = yTop + boxH/2 - flagH/2;
      int fx = gx + 10 + pad;
      if (img != null) {
        image(img, fx, fy, flagW, flagH);
      }

      fill(0);
      int textX = fx + flagW + 12;
      int textY = yTop + boxH/2;
      text(country, textX, textY);
    }
  }

  noLoop();
}

PImage getFlag(String country) {
  if (flags.containsKey(country)) return flags.get(country);

  String fname = fileMap.get(country);
  PImage img = null;
  if (fname != null) {
    img = loadImage("flags/" + fname);
  }
  flags.put(country, img);
  return img;
}
