class Scene {
  ArrayList<Element> elements;

  Scene() {
    elements = new ArrayList<Element>();
  }

  void onMousePressed() {
    for (Element e : elements) {
      boolean success = (mouseX >= e.x && mouseX <= e.x + e.w) &&
                        (mouseY >= e.y && mouseY <= e.y + e.h);
    }
  }

  void onKeyPressed() {}

  void reset() {}

  void draw() {
    for (Element e : elements) {
      e.draw();
    }

    // HEADER

    // Title
    pushStyle();

    noStroke();
    fill(colAccentDark);
    textFont(fontTitle);
    textAlign(LEFT, TOP);
    text("Die Brennstoffzelle", 30, 25);

    popStyle();

    // Navigation Bar
  }
}
