class Car
{
    TripComputer tripComputer;
    FuelComputer fuelComputer;
    FuelTank fuelTank;
    Car()
    {
        
    }

    void processInput()
    {
        tripComputer.RPM=dataStream.readRPM();
        tripComputer.gear_ratio=dataStream.readRatio();
        tripComputer.getCurrentSpeed();
        tripComputer.updateTotalDistance(dataStream.readTime());

        fuelTank.getFuelLevel();
        fuelTank.getConsumedFuel();

        fuelComputer.calculateFuelEconomy(tripComputer.distance);
        fuelComputer.calculateAverageFuelEconomy();
        fuelComputer.calculateFuelConsumption();
        fuelComputer.calculateRange();
    }
}
