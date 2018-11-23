class TripComputer
{
      int RPM;
      float gear_ratio;
      float totalTravelledDistance; 
      float speed; 
    
    //Calculates the current Speed
    void getCurrentSpeed()
    {
      speed = (RPM/60)*(1/gear_ratio)*2*PI*0.23;
    }

    //Calculates and updates the total Distance Traveled.
    void updateTotalDistance()
    {
      totalTravelledDistance += speed; 
    }

}
