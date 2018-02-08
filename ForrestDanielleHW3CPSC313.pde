/*
Author: Danielle Forrest
 CPSC 313 HW 3
 This program loads in wins and losses of MLB teams and 
 displays them with a line graph.
 2/03/2018
 */

Table table1;//wins
Table table2;//losses
int rowCount;
int columnCount;
ArrayList<Team> teamList;
Team newTeam;
int rowInt;


void setup() {
  rowInt = 0;
  teamList = new ArrayList<Team>();
  table1 = loadTable("wins.csv");
  table2 = loadTable("losses.csv");
  rowCount = table1.getRowCount();
  columnCount = table1.getColumnCount();
  size(800, 500);
  background(255);
  getData();
}
void draw() {
  //keyPressed();
  shapeDesign();
}
/**
 draws the graph based on the input from the teams class
 **/
void shapeDesign() {
  noFill();
  for (int i = 0; i < rowCount; i++) {
    newTeam = teamList.get(i);
    keyPressed(newTeam);
    PShape lines = createShape();
    stroke(newTeam.getColor(), 0, 0);
    lines.beginShape();
    for (int j = 1; j < columnCount-1; j++) {
      lines.vertex(j * ((float)width/(float)columnCount), ((newTeam.getWinPercent().get(j)) * (height/100)) );
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

void keyPressed(Team team) {
  if (key == CODED) {
    if (keyCode == UP) {
      if (rowInt < 0) {
        rowInt = rowCount;
        team.setColor(1);
      } else {
        rowInt--;
        team.setColor(1);
      }
    } else if (keyCode == DOWN) {
      if (rowInt > rowCount) {
        rowInt = 0;
        team.setColor(1);
      } else {
        team.setColor(1);
        rowInt ++;
      }
    } else {
      team.setColor(0);
    }
  }
}