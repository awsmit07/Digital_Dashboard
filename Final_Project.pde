//Final Project
//Andreas Smit
import processing.sound.*;
Table carTable;
Table truckTable;
TableRow carRow;
TableRow truckRow;
int count=0;
void setup()
{
    println(sketchPath()+dataPath("/data/car_status_BMW_323i.csv"));
    carTable=loadTable(sketchPath()+dataPath("/data/car_status_BMW_323i.csv"), "header");
    truckTable=loadTable(sketchPath()+dataPath("/data/car_status_Truck_F150.csv"), "header");
    
    size(1080, 720);
    frameRate(5);
}

void draw()
{
    background(0);
    carRow=carTable.getRow(count);
    truckRow=truckTable.getRow(count);
    String carString="Time: "+ carRow.getInt("Time") +" Gear: "+ carRow.getFloat("Gear Ratio")+" Fuel: "+carRow.getFloat("Fuel Level")+" RPM: "+carRow.getInt("RPM")+" Y: "+carRow.getFloat("X")+" X: "+carRow.getFloat("Y");
    String truckString="Time: "+ truckRow.getInt("Time") +" Gear: "+ truckRow.getFloat("Gear Ratio")+" Fuel: "+truckRow.getFloat("Fuel Level")+" RPM: "+truckRow.getInt("RPM")+" Y: "+truckRow.getFloat("X")+" X: "+truckRow.getFloat("Y");
    fill(255);
    text(carString, width/2, 100);
    text(truckString, width/2, 125);
    count++;
}
