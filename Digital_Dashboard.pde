//Final Project
//Andreas Smit & Kim Rooney

SensorDataProvider dataStream;
TripComputer tripComputer;
Gauge fuelGauge;
Gauge speedometer;
Gauge tackometer;
boolean inputMode = true;
String file="";
CarButton carButton;
TruckButton truckButton;
ExitButton exitButton;
Compass compass;
FuelTank fuelTank;
float radius=0;
int currentIndex=-1;
float tankCapacity;

//SETUP
void setup()
{
    
    size(1080, 720);
    frameRate(30);
    fuelGauge=new Gauge(0, 60, "L", 100, 100, "Fuel");
    speedometer=new Gauge(0, 300, "km/h", 250, 100, "Speed");
    tackometer=new Gauge(0, 10000, "RPM", 400, 100, "RPM");
    compass=new Compass(0,0,width/2, 100);
    tripComputer=new TripComputer();
    carButton=new CarButton(width/2-50, height/3-50, 100, 25, "Car", #7907fc, #f407fc, #070ffc);
    truckButton=new TruckButton(width/2-50, height/3-20, 100, 25, "Truck", #7907fc, #f407fc, #070ffc);
    exitButton=new ExitButton(width/2-50, height/3+10, 100, 25, "Exit", #7907fc, #f407fc, #070ffc);
}

//DRAW
void draw()
{
    background(0);
    
    if(inputMode)
    {
        carButton.button_update();
        truckButton.button_update();
        exitButton.button_update();
    }
    
    if(!inputMode)
    {
        currentIndex++;
        frameRate(10);
        dataStream.readNext();
        tripComputer.RPM=dataStream.readRPM();
        tripComputer.gear_ratio=dataStream.readRatio();
        tripComputer.getCurrentSpeed();
        tripComputer.updateTotalDistance(dataStream.readTime());
        compass.update(dataStream.readY(), dataStream.readX());
        fuelGauge.getInput(dataStream.readFuel());
        tackometer.getInput(dataStream.readRPM());
        speedometer.getInput(tripComputer.speed*3.6);
        fill(255);
        text(nf(tripComputer.totalTravelledDistance*0.001,0, 2) +"km", 100, 300);
        text(dataStream.readTime()/60 +":"+nf(dataStream.readTime()%60, 2, 0), 500, 100);
    }
    if(currentIndex>600)
    {
        frameRate(30);
        currentIndex=-1;
        inputMode=true;
    }
}
