class ButtonAction extends Button {

  int paddingX;
  int paddingY;
  String label;
  ButtonCallback callback;

  ButtonAction(int x, int y, int paddingX, int paddingY, String label, ButtonCallback callback) {
    super(x, y, 32, 32);
    this.x = x;
    this.y = y;
    this.paddingX = paddingX;
    this.paddingY = paddingY;
    this.label = label;
    this.callback = callback;

    pushStyle();

    this.setFontStyle(false);
    this.w = int(textWidth(label)) + paddingX * 2;
    this.h = int(g.textLeading) + paddingY * 2;

    popStyle();
  }

  void setFontStyle(boolean useHoverStyle) {
    if (useHoverStyle) {
      fill(colPrimary);
    }
    else {
      fill(colText);
    }
    textFont(fontBodyBold);
    textAlign(LEFT, TOP);
  }

  @Override
  void onClick(boolean insideElement) {
    if (insideElement) {
      callback.onClick();
    }
  }

  void draw() {
    // Background
    pushStyle();

    noFill();
    stroke(colPrimary);
    strokeWeight(defaultStrokeWeight);

    // Set stroke on the inside(!) of the rectangle
    rect(
      this.x + (defaultStrokeWeight / 2),
      this.y + (defaultStrokeWeight / 2),
      this.w - (defaultStrokeWeight),
      this.h - (defaultStrokeWeight)
    );

    popStyle();

    // Text

    pushStyle();

    setFontStyle(this.isHovered);
    text(this.label, this.x + this.paddingX, this.y + (this.paddingY * 1.2));

    popStyle();
  }
}