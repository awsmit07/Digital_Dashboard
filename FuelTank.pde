class FuelTank 
{
  float [] fuelConsumed = new float [dataStream.dataTable.getRowCount()];
  float lastFuelLevel = 0;
  int j = 0;
  float fuelLevel;

  FuelTank () {
  }

  void getfuelLevel()
  {
    fuelLevel = dataStream.readFuel();
  }
  //Calculates the reamining fuel using input fuel levels
  void getConsumedFuel()
  {
    if (j==0) fuelConsumed[j]=0;
    else
    {
      fuelConsumed[j]= fuelLevel - lastFuelLevel;
      
    }
    lastFuelLevel = dataStream.readFuel();
    j++;
  }
  
 
}
