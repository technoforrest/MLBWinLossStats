class Team {
  TableRow wins;
  TableRow losses;
  int columns;
  int colorFlag;
  int strokeWFlag;
  int colorInt;
  int strokeWInt;
  /**
   Default constructor
   **/
  Team() {
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

  void setColor(int flag) {
    colorFlag = flag;
    if (colorFlag == 1) {
      colorInt = 255;
    } else colorInt = 0;
    getColor();
  }
  int getColor() {
    return colorInt;
  }
  void setStrokeWeight(int flag) {
    
    if (flag == 1) {
      strokeWInt = 5;
    } else strokeWInt = 1;
    getStrokeWeight();
  }
  int getStrokeWeight(){
    return strokeWInt;
  }
}