class TripComputer
{
    int RPM;
    float gear_ratio;
    float totalTravelledDistance; 
    float speed; 
    
    //Calculates the current Speed
    void getCurrentSpeed()
    {
      speed = (((float)RPM)/60.0)*(1/((float)gear_ratio))*2*PI*radius;
    }

    //Calculates and updates the total Distance Traveled.
    void updateTotalDistance(int time)
    {
      if (currentIndex<=600) totalTravelledDistance += speed; 
    }

}
