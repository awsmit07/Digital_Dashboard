//Final Project
//Andreas Smit & Kim Rooney

SensorDataProvider dataStream;
TripComputer tripComputer;
Gauge fuelGauge;
Gauge speedometer;
Gauge tackometer;

//SETUP
void setup()
{
    dataStream=new SensorDataProvider("car_status_BMW_323i.csv");
    size(1080, 720);
    frameRate(5);
    fuelGauge=new Gauge(0, 60, "L", 100, 100, "Fuel");
    speedometer=new Gauge(0, 200, "km/h", 250, 100, "Speed");
    tackometer=new Gauge(0, 10000, "RPM", 400, 100, "RPM");
    tripComputer=new TripComputer();
}

//DRAW
void draw()
{
    background(0);
    dataStream.readNext();
    String carString="Time: "+ dataStream.readTime() +" Gear: "+ dataStream.readRatio()+" Fuel: "+dataStream.readFuel()+" RPM: "+dataStream.readRPM()+" Y: "+dataStream.readY()+" X: "+dataStream.readX();
    tripComputer.RPM=dataStream.readRPM();
    tripComputer.gear_ratio=dataStream.readRatio();
    tripComputer.getCurrentSpeed();
    tripComputer.updateTotalDistance(dataStream.readTime());
    fill(255);
    //text(carString, width/2, 100);
    text(dataStream.readTime()/60 +":"+dataStream.readTime()%60, 500, 100);
    fuelGauge.getInput(dataStream.readFuel());
    tackometer.getInput(dataStream.readRPM());
    speedometer.getInput(tripComputer.speed*3.6);
    text(nf(tripComputer.totalTravelledDistance,0, 2) +"km", 100, 300);
}
