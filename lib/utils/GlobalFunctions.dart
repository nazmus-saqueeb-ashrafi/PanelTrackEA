
  // Calculating aspect ratio based on width of our Figma design
  double globalSize(double size, double width){
// size is the size of the Widget in Figma file
// width is the screen width of the device
    const int figBaseWidth = 360;

    double ratio = size/figBaseWidth;
    return ratio * width;
  }

