class SensorDataProvider
{
    private Table dataTable;
    private String filePath;
    private int currentIndex=-1;
    public TableRow row;

    //Initializes the new SensorDataProvidor
    //file:String of the name of the data table to be accessed.
    SensorDataProvider (String file) 
    {
        filePath=sketchPath()+dataPath("/data/"+file);
        dataTable=loadTable(filePath, "header");
    }

    //Increments the index of the data table and sets the row to
    //the row with the index of currrentIndex
    public void readNext()
    {
        if(currentIndex<dataTable.getRowCount())
        {
            currentIndex++;
            row=dataTable.getRow(currentIndex);
        }
    }

    //Returns Time value of current row
    public int readTime()
    {
        return row.getInt("Time");
    }

    //Returns RPM value of current row
    public int readRPM()
    {
        return row.getInt("RPM");
    }

    //Returns Fuel Level value of current row
    public float readFuel()
    {
        return row.getFloat("Fuel Level");
    }

    //Returns Gear Ratio value of current row
    public float readRatio()
    {
        return row.getFloat("Gear Ratio");
    }

    //Returns X value of current row
    public float readX()
    {
        return row.getFloat("X");
    }

    //Returns Y value of current row
    public float readY()
    {
        return row.getFloat("Y");
    }
}
