//Final Project
//Andreas Smit & Kim Rooney
import processing.sound.*;


SensorDataProvider dataStream;
void setup()
{
    dataStream=new SensorDataProvider("car_status_BMW_323i.csv");
    size(1080, 720);
    frameRate(5);
}

void draw()
{
    background(0);
    dataStream.readNext();
    TableRow carRow=dataStream.row;
    String carString="Time: "+ carRow.getInt("Time") +" Gear: "+ carRow.getFloat("Gear Ratio")+" Fuel: "+carRow.getFloat("Fuel Level")+" RPM: "+carRow.getInt("RPM")+" Y: "+carRow.getFloat("X")+" X: "+carRow.getFloat("Y");
    fill(255);
    text(carString, width/2, 100);
}
