/*
Author: Danielle Forrest
 CPSC 313 HW 3
 This program loads in wins and losses of MLB teams and 
 displays them with a line graph.
 2/13/2018
 */

Table table1;//wins
Table table2;//losses
int rowCount;
int columnCount;
ArrayList<Team> teamList;
Team newTeam;
int rowInt;
Boolean onStart;

/**
 Set up takes information from CSV files and places the information in necessary arrays and variables
 so the graph can be created in the draw function
 **/
void setup() {
  rowInt = 0;
  onStart = true;
  teamList = new ArrayList<Team>();
  table1 = loadTable("wins.csv");
  table2 = loadTable("losses.csv");
  rowCount = table1.getRowCount();
  columnCount = table1.getColumnCount();
  size(900, 800);
  background(255, 255, 255);
  strokeWeight(1);
  textSize(36);
  getData();
  for (int i = 0; i < rowCount; i++) {
    teamList.get(i).isSelected(false);
    teamList.get(i).setColorR((int)random(0, 175));
    teamList.get(i).setColorG((int)random(0, 175));
    teamList.get(i).setColorB((int)random(0, 175));
  }
  teamList.get(0).isSelected(true);
  teamList.get(0).setColorR(255);
  teamList.get(0).setColorG(0);
  teamList.get(0).setColorB(0);
}
/**
 The draw function draws the information based on which team is selected and
 what information is in the shapeDesign function
 **/
void draw() {
  println("rowInt = " + rowInt);
  background(255, 255, 255);
  shapeDesign();
  teamList.get(rowInt).isSelected(true);
  if (rowInt > 0) {
    teamList.get(rowInt - 1).isSelected(false);
  }
  if (rowInt < rowCount-1) {
    teamList.get(rowInt + 1).isSelected(false);
  }
  if (rowInt == 0) {
    teamList.get(rowCount - 1).isSelected(false);
  }
  if (rowInt == rowCount - 1) {
    teamList.get(0).isSelected(false);
  }
  fill(100, 0, 200);
  text(teamList.get(rowInt).getName(), 600, 100);
}
/**
 shapes the graph based on the input from the teams class
 **/
void shapeDesign() {
  noFill();
  for (int i = 0; i < rowCount; i++) {
    PShape lines = createShape();
    stroke(teamList.get(i).getColorR(), teamList.get(i).getColorG(), teamList.get(i).getColorB());
    strokeWeight(teamList.get(i).getStrokeWeight());
    lines.beginShape();
    for (int j = 0; j < columnCount-1; j++) {
      lines.vertex(j * (((float)width - 40)/(float)columnCount) + 20, (((teamList.get(i).getWinPercent().get(j) ) * (((float)height - 40)/100)) + 20) );
    }
    lines.endShape();
    shape(lines);
  }
}
/**
 extracts data from tables and creates an arrayList of team objects
 **/
void getData() {
  for (int i = 0; i < rowCount; i ++) {
    if (table1.getRow(i) != null) {
      teamList.add(new Team(table1.getRow(i), table2.getRow(i), columnCount));
    } else
      print(" table1.getRow(i) is NULL! ");
  }
}

/**
 increases or decreases rowInt based on user keyboard input
 **/
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if ( rowInt < rowCount - 1 ) {
        rowInt ++;
      } else if (rowInt >= rowCount - 1) {
        rowInt = 0;
      }
    } 
    if (keyCode == DOWN) {
      if (rowInt > 0) {
        rowInt--;
      } else if (rowInt <= 0 ) {
        rowInt = rowCount - 1;
      }
    }
  }
}