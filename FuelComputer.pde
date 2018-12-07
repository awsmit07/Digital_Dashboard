class FuelComputer
{
  float fuelEconomy=0;
  float fuelConsumption;
  float [] fuelEconomyHistory = {};
  float averageFuelEconomy=0;
  float range=0; 
  float remainingFuel;
  int i = 0;

  //Calculates the fuel economy of the car in km/L
  void calculateFuelEconomy(float distanceTravelled)
  {
    if(currentIndex<car.fuelTank.fuelConsumed.length)
    {
      if(car.fuelTank.fuelConsumed[currentIndex]!=0)
      {
        fuelEconomy = distanceTravelled/car.fuelTank.fuelConsumed[currentIndex]; 
        //println(fuelEconomy);
        
        //println(fuelEconomyHistory);
      }
    }
  }

  //Calculates the average fuel economy
  void calculateAverageFuelEconomy()
  {
    float sum=0;
    fuelEconomyHistory = append(fuelEconomyHistory, fuelEconomy);
    if(fuelEconomyHistory.length>=60)
    {
      //println("CURRENT INDEX: "+ currentIndex);
      for(int i=fuelEconomyHistory.length-60;i<fuelEconomyHistory.length; i++) 
      {
        sum+=fuelEconomyHistory[i];
        
        //println(i);
      }
      sum/=60;
    }
    else 
    {
      for(int i=0; i<fuelEconomyHistory.length; i++) sum+=fuelEconomyHistory[i];
      sum/= fuelEconomyHistory.length;
      
    }
    averageFuelEconomy=sum;
  }

  //Calculates the rate of fuel consumption in L/sec
  void calculateFuelConsumption()
  {
    if (averageFuelEconomy!=0) fuelConsumption = (1/averageFuelEconomy)*100;
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
      range = averageFuelEconomy*car.fuelTank.fuelLevel;
    }
  }
}
