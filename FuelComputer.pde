class FuelComputer
{
  float fuelEconomy;
  float fuelConsumption;
  float [] fuelEconomyHistory = new float [dataStream.dataTable.getRowCount()];
  float averageFuelEconomy;
  float range=0; 
  float remainingFuel;
  int i = 0;

  //Calculates the fuel economy of the car in km/L
  void calculateFuelEconomy(float distanceTravelled)
  {
    if(currentIndex<fuelTank.fuelConsumed.length)
    {
      if(fuelTank.fuelConsumed[currentIndex]!=0)
      {
        float sum=0;
        for(int i=0; i<fuelTank.fuelConsumed.length; i++) sum+=fuelTank.fuelConsumed[i];
        fuelEconomy = distanceTravelled/sum; 
        //println(fuelEconomy);
        fuelEconomyHistory[currentIndex] = fuelEconomy;
        //println(fuelEconomyHistory);
      }
    }
  }

  //Calculates the average fuel economy
  void calculateAverageFuelEconomy()
  {
      float sum=0;
      for(int i=0; i<fuelEconomyHistory.length; i++) 
      {    
          sum+=fuelEconomyHistory[i];
          
      }
      //println(sum);
      averageFuelEconomy=sum/currentIndex;
  }

  //Calculates the rate of fuel consumption in L/sec
  void calculateFuelConsumption()
  {
    fuelConsumption = (1/averageFuelEconomy)*100;
  }

  void calculateRange() 
  {
    if(currentIndex<fuelEconomyHistory.length)
    {
      float briefFuelEconomy = 0;
      for (int j = currentIndex; j > currentIndex-60 && j>0; j--)
        briefFuelEconomy += fuelEconomyHistory[j];
      //println(briefFuelEconomy);
      briefFuelEconomy /= 60;
      range = briefFuelEconomy*fuelTank.fuelLevel;
    }
  }
}
