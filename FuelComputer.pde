class FuelComputer
{
      float fuelEconomy;
      float fuelConsumption;
      float [] fuelEconomyHistory = new float [dataStream.dataTable.getRowCount()];
      float averageFuelEconomy;
      float range; 
      float distanceTravelled;
      float remainingFuel;
      int i = 0;

    //Calculates the fuel economy of the car in km/L
    void calculateFuelEconomy()
    {
      fuelEconomy = distanceTravelled/fuelTank.fuelConsumed[i]; 
      fuelEconomyHistory[i] = fuelEconomy; 
      i++;
    }

    //Calculates the average fuel economy
    void calculateAverageFuelEconomy()
    {
      for(int j = 0; j < i ; j++)
        averageFuelEconomy += fuelEconomyHistory[j];
      averageFuelEconomy = averageFuelEconomy/i;
    }

    //Calculates the rate of fuel consumption in L/sec
    void calculateFuelConsumption()
    {
      fuelConsumption = (1/averageFuelEconomy)*100;
    }
    
    void calculateRange() 
    {
      float briefFuelEconomy = 0;
      for(int j = i; j > i-60 ; j--)
        briefFuelEconomy += fuelEconomyHistory[j];
      briefFuelEconomy /= 60;
      range = briefFuelEconomy*remainingFuel; 
    }
}
