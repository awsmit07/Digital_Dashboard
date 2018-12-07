//Final Project
//Andreas Smit & Kim Rooney
import org.gicentre.utils.stat.*;

//Display Objects
Graph consumptionChart;
Graph economyChart;
Box odometer;
Box range;
Box fe;
Box fc;
Gauge fuelGauge;
Gauge speedometer;
Gauge tackometer;

//Data Variables
Compass compass;
SensorDataProvider dataStream;
GPS gps;
Car car;

//Buttons
CarButton carButton;
TruckButton truckButton;
ExitButton exitButton;
MenuButton menuButton;
GPSModeButton gpsModeButton;

//Other Variables
String file="";
float radius=0;
int currentIndex=-1;
float tankCapacity;
int frames=0;
boolean gpsMode=false;
boolean inputMode = true;

//SETUP
void setup()
{
    size(1080, 850);
    frameRate(10);
    carButton=new CarButton(width/2-50, height/3-50, 100, 25, "Car", #7907fc, #f407fc, #070ffc);
    truckButton=new TruckButton(width/2-50, height/3-20, 100, 25, "Truck", #7907fc, #f407fc, #070ffc);
    exitButton=new ExitButton(width/2-50, height/3+10, 100, 25, "Exit", #7907fc, #f407fc, #070ffc);
    menuButton=new MenuButton(0, 0, 50, 50, "MENU", #7907fc, #f407fc, #070ffc);
    gpsModeButton=new GPSModeButton(0, 50, 50, 50, "GPS", #7907fc, #f407fc, #070ffc);
}

//DRAW
void draw()
{
    
    
    if(inputMode)
    {
        background(0);
        carButton.button_update();
        truckButton.button_update();
        exitButton.button_update();
    }
    
    if(!inputMode && currentIndex==-1)
    {
        background(0);
        currentIndex++;
        dataStream=new SensorDataProvider(file);
        dataStream.readNext();
        compass=new Compass(0,0,width/2, 35);

        //Car
        car=new Car();
        car.tripComputer=new TripComputer();
        car.fuelTank=new FuelTank(tankCapacity, dataStream.readFuel());
        car.fuelComputer=new FuelComputer();

        //Gauges
        fuelGauge=new Gauge(0, (int)car.fuelTank.fuelCapacity, " L", 240, 300, "Fuel Gauge");
        speedometer=new Gauge(0, 300, " km/h", 540, 200, "Speedometer");
        tackometer=new Gauge(0, 10000, " RPM", 840, 300, "Tachometer");

        //Graphs
        consumptionChart=new Graph(width-500, 600, 0, 30, this, 40, "Fuel Consumption");
        economyChart=new Graph(20, 600, 0, 1, this, 40, "Average Fuel Economy");

        //Text Boxes
        odometer=new Box(540, 425, 300, 35);
        range=new Box(540, 500, 300, 35);
        fe=new Box(240, 550, 300, 35);
        fc=new Box(840,550, 400, 35);
        gps=new GPS();
        frameRate(30);
        frames=0;
    }
    if(!inputMode)
    {
        if(frames==0)
        {
            background(0);
            //Update Data
            dataStream.readNext();
            
            //Update Car
            compass.update(dataStream.readY(), dataStream.readX());
            car.processInput();
            
            //Update Charts & GPS
            consumptionChart.updateData(car.fuelComputer.fuelConsumption);
            economyChart.updateData(car.fuelComputer.averageFuelEconomy);
            gps.updateGPSData(dataStream.readY(), dataStream.readX());
            
            //Time
            text("Time: "+dataStream.readTime()/60 +":"+nf(dataStream.readTime()%60, 2, 0), 1020, 30);
            if(!gpsMode)
            {
                //Draws Gauges
                fuelGauge.getInput(dataStream.readFuel());
                tackometer.getInput(dataStream.readRPM());
                speedometer.getInput(car.tripComputer.speed*3.6);
                
                //Draws Charts
                consumptionChart.drawChart();
                economyChart.drawChart();
                fill(255);

                //Draw Boxes
                odometer.update("Odometer: "+nf(car.tripComputer.totalTravelledDistance,0, 2) +" km");
                range.update("Range: "+nf(car.fuelComputer.range,0,2) +" km");
                fe.update("Fuel Economy: "+nf(car.fuelComputer.fuelEconomy,0,2)+" km/liter");
                fc.update("Fuel Consumption: "+nf(car.fuelComputer.fuelConsumption,0,2)+" liter/100km");
            }
            if(gpsMode)
            {
                gps.drawGPS();
            }
            
            currentIndex++; 
        }
        menuButton.button_update();
        gpsModeButton.button_update();
        frames++;
        frames%=30;
    }
    if(currentIndex>600)
    {
        frameRate(30);
        currentIndex=-1;
        inputMode=true;
    }
}
