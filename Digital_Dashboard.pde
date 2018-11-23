//Final Project
//Andreas Smit & Kim Rooney

SensorDataProvider dataStream;

//SETUP
void setup()
{
    dataStream=new SensorDataProvider("car_status_BMW_323i.csv");
    size(1080, 720);
    frameRate(5);
}

//DRAW
void draw()
{
    background(0);
    dataStream.readNext();
    String carString="Time: "+ dataStream.readTime() +" Gear: "+ dataStream.readRatio()+" Fuel: "+dataStream.readFuel()+" RPM: "+dataStream.readRPM()+" Y: "+dataStream.readY()+" X: "+dataStream.readX();
    fill(255);
    text(carString, width/2, 100);
}
