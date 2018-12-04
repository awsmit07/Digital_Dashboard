class FuelTank 
{
  float [] fuelConsumed = new float [dataStream.dataTable.getRowCount()];
  float lastFuelLevel = 0;
  int j = 0;
  float fuelLevel;
  float fuelCapacity;

  FuelTank (float fuelCapacity) 
  {
    this.fuelCapacity=fuelCapacity;
  }

  void getFuelLevel()
  {
    fuelLevel = dataStream.readFuel();
  }
  //Calculates the reamining fuel using input fuel levels
  void getConsumedFuel()
  {
    if (currentIndex==0) fuelConsumed[currentIndex]=0;
    else
    {
      fuelConsumed[currentIndex]= lastFuelLevel-fuelLevel;
      //println( lastFuelLevel-fuelLevel );
    }
    lastFuelLevel = dataStream.readFuel();
  }
  
 
}
