class Scene {
  ArrayList<Element> elements;

  Scene() {
    elements = new ArrayList<Element>();

    // Navigation
    Button[] buttonsNav = new Button[3];
    String[] buttonLabels = {"Start", "Infografik", "Quiz"};

    int currXPos = 591;

    for (int i = 0; i <= 2; i++) {
      buttonsNav[i] = new ButtonNavigation(currXPos, 42, 24, buttonLabels[i], i);
      elements.add(buttonsNav[i]);
      currXPos += buttonsNav[i].w;
    }
  }

  void onMousePressed() {
    for (Element e : elements) {
      if ((mouseX >= e.x && mouseX <= e.x + e.w) &&
          (mouseY >= e.y && mouseY <= e.y + e.h)) {

      e.onClick();
      }
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
