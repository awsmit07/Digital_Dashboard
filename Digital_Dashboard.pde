//Final Project
//Andreas Smit & Kim Rooney
import org.gicentre.utils.stat.*;

Graph consumptionChart;
Graph economyChart;
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
FuelComputer fuelComputer;
int frames=0;


//SETUP
void setup()
{
    
    size(1080, 850);
    frameRate(10);
    carButton=new CarButton(width/2-50, height/3-50, 100, 25, "Car", #7907fc, #f407fc, #070ffc);
    truckButton=new TruckButton(width/2-50, height/3-20, 100, 25, "Truck", #7907fc, #f407fc, #070ffc);
    exitButton=new ExitButton(width/2-50, height/3+10, 100, 25, "Exit", #7907fc, #f407fc, #070ffc);
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
        tripComputer=new TripComputer();
        fuelTank=new FuelTank(tankCapacity, dataStream.readFuel());
        fuelComputer=new FuelComputer();
        fuelGauge=new Gauge(0, (int)fuelTank.fuelCapacity, " L", 240, 300, "Fuel Gauge");
        speedometer=new Gauge(0, 300, " km/h", 540, 200, "Speedometer");
        tackometer=new Gauge(0, 10000, " RPM", 840, 300, "Tachometer");
        tripComputer=new TripComputer();
        consumptionChart=new Graph(width-500, 600, 0, 30, this, 40, "Fuel Consumption");
        economyChart=new Graph(20, 600, 0, 1, this, 40, "Average Fuel Economy");
        frameRate(30);
        frames=0;
    }
    if(!inputMode)
    {
        if(frames==0)
        {
            background(0);
              
            dataStream.readNext();
            tripComputer.RPM=dataStream.readRPM();
            tripComputer.gear_ratio=dataStream.readRatio();
            tripComputer.getCurrentSpeed();
            tripComputer.updateTotalDistance(dataStream.readTime());
            compass.update(dataStream.readY(), dataStream.readX());
            fuelTank.getFuelLevel();
            fuelTank.getConsumedFuel();
            
            fuelComputer.calculateFuelEconomy(tripComputer.distance); //<>//
            fuelComputer.calculateAverageFuelEconomy();
            fuelComputer.calculateFuelConsumption();
            fuelComputer.calculateRange();
            
            fuelGauge.getInput(dataStream.readFuel());
            tackometer.getInput(dataStream.readRPM());
            speedometer.getInput(tripComputer.speed*3.6);
            consumptionChart.updateData(fuelComputer.fuelConsumption);
            consumptionChart.drawChart();
            economyChart.updateData(fuelComputer.averageFuelEconomy);
            economyChart.drawChart();
            fill(255);
            text("Odometer: "+nf(tripComputer.totalTravelledDistance,0, 2) +" km", 540, 425);
            text("Time: "+dataStream.readTime()/60 +":"+nf(dataStream.readTime()%60, 2, 0), 1020, 30);
            text("Range: "+fuelComputer.range +" km", 540, 500);
            text("Fuel Economy: "+fuelComputer.fuelEconomy+" km/liter", 240, 550);
            text("Fuel Consumption: "+fuelComputer.fuelConsumption+" liter/100km",840,550);
            currentIndex++; 
        }
        frames++;
        frames%=3;
        //println(frames);
    }
    if(currentIndex>600)
    {
        frameRate(30);
        currentIndex=-1;
        inputMode=true;
    }
}
