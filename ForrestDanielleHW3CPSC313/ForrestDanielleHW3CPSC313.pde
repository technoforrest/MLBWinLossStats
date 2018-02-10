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
Boolean onStart;

void setup() {
  rowInt = 0;
  onStart = true;
  teamList = new ArrayList<Team>();
  table1 = loadTable("wins.csv");
  table2 = loadTable("losses.csv");
  rowCount = table1.getRowCount();
  columnCount = table1.getColumnCount();
  size(800, 500);
  background(255, 255, 255);
  strokeWeight(1);
  textSize(36);
  getData();
  teamList.get(0).setColor(1);
  teamList.get(0).setStrokeWeight(1);
}
void draw() {
  println("inside draw" + onStart);
  background(255, 255, 255);
  shapeDesign();
  if (rowInt == 0 && onStart) {
    onStart = true;
  } else
    onStart = false;

  fill(0, 0, 255);
  text(teamList.get(rowInt).getName(), 600, 100);
}
/**
 draws the graph based on the input from the teams class
 **/
void shapeDesign() {
  noFill();
  for (int i = 0; i < rowCount; i++) {
    PShape lines = createShape();
    stroke(teamList.get(i).getColor(), 0, 0);
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

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if ( rowInt < rowCount - 1 ) {
        if (rowInt <= 0 && onStart) {
          teamList.get(0).setColor(1);
          teamList.get(0).setStrokeWeight(1);
          rowInt++;
        } else if (rowInt <= 0 && !onStart) {
          println("RowInt is less than or equal to zero" + rowInt);
          teamList.get(0).setColor(0);
          teamList.get(0).setStrokeWeight(0);
          teamList.get(rowInt).setColor(1);
          teamList.get(rowInt).setStrokeWeight(1);
          rowInt++;
        } else {
          teamList.get(rowInt).setColor(1);
          teamList.get(rowInt).setStrokeWeight(1);
          teamList.get(rowInt - 1).setColor(0);
          teamList.get(rowInt - 1).setStrokeWeight(0);
          println("inside else" + "RowInt = " + rowInt);
          rowInt ++;
        }
      } else if (rowInt >= rowCount - 1) {
        rowInt = 0;
        teamList.get(rowInt).setColor(1);
        teamList.get(rowInt).setStrokeWeight(1);
        teamList.get(rowCount - 2).setColor(0);
        teamList.get(rowCount - 2).setStrokeWeight(0);
      }
    } 
    if (keyCode == DOWN) {
      if (rowInt < rowCount - 1) {
        if (rowInt <= 0 && onStart) {
          rowInt = rowCount;
          teamList.get(0).setColor(0);
          teamList.get(0).setStrokeWeight(0);
          teamList.get(rowInt).setColor(1);
          teamList.get(rowInt).setStrokeWeight(1);
          rowInt--;
        } else if (rowInt <= 0 && !onStart) {
          rowInt = rowCount;
          teamList.get(0).setColor(0);
          teamList.get(0).setStrokeWeight(0);
          teamList.get(rowInt).setColor(1);
          teamList.get(rowInt).setStrokeWeight(1);
          rowInt--;
        } else {
          teamList.get(rowInt).setColor(1);
          teamList.get(rowInt).setStrokeWeight(1);
          teamList.get(rowInt + 1).setColor(0);
          teamList.get(rowInt + 1).setStrokeWeight(0);
          println("inside else" + "RowInt = " + rowInt);
          rowInt --;
        }
      } else if (rowInt >= rowCount - 1) {
        teamList.get(rowInt).setColor(1);
        teamList.get(rowInt).setStrokeWeight(1);
        teamList.get(rowInt + 1).setColor(0);
        teamList.get(rowInt + 1).setStrokeWeight(0);
        rowInt --;
      } 
    }
  }
}