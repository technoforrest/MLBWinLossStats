class Team {
  TableRow wins;
  TableRow losses;
  int columns;
  int colorFlag;
  int strokeWFlag;
  int colorR;
  int colorG;
  int colorB;
  int strokeWInt;
  /**
   Default constructor
   **/
  Team() {
    strokeWInt = 1;
    colorR = 0;
    colorG = 0;
    colorB = 0;
  }
  /**
   Parameterized constructor
   @param TableRow newWin gets row from csv file "wins.csv" in main
   @param TableRow newLoss gets row from csv file "losses.csv" in main
   @param int columnCount gets number of columns determined in main
   **/
  Team( TableRow newWin, TableRow newLoss, int columnCount) {
    //print("inside parameter constructor");
    wins = newWin;
    columns = columnCount;
    //print(" wins = " + wins.getInt(15) + " ");
    losses = newLoss;
    strokeWInt = 1;
    colorR = 0;
    colorG = 0;
    colorB = 0;
  }

  /**
   @return returns name of team
   **/
  String getName() {
    return wins.getString(0);
  }
  /**
   @return returns an arraylist of the win percentages for the team object
   **/
  ArrayList<Float> getWinPercent() {
    ArrayList<Float> percentArr = new ArrayList<Float>();

    for (int i = 1; i < columns; i++) {
      if ((wins.getInt(i) + losses.getInt(i)) != 0) {
        percentArr.add(wins.getFloat(i)/ (wins.getFloat(i) + losses.getFloat(i)) * 100);
      } else {
        percentArr.add(-1.0);
      }
    }
    return percentArr;
  }
  /**
   sets the value of Red
   **/
  void setColorR(int R) {
    colorR = R;
  }
  /**
   sets the value of Green
   **/
  void setColorG(int G) {
    colorG = G;
  }
  /**
   sets the value of Blue
   **/
  void setColorB(int B) {
    colorB = B;
  }
  /**
   gets the value of Red
   **/
  int getColorR() {
    return colorR;
  }
  /**
   gets the value of Green
   **/
  int getColorG() {
    return colorG;
  }
  /**
   gets the value of Blue
   **/
  int getColorB() {
    return colorB;
  }
  /**
   gets the value of the strokeWeight
   **/
  int getStrokeWeight() {
    return strokeWInt;
  }
  /**
   determines if the team is selected and sets the strokeweight
   @param is a boolean from setup or draw 
   @returns true if the team is selected or false if it is not selected
   **/
  Boolean isSelected(Boolean redLine) {
    if (redLine) {
      strokeWInt = 10;

      return true;
    } else {
      strokeWInt = 1;

      return false;
    }
  }
}