class SensorDataProvider
{
    private Table dataTable;
    private String filePath;
    private int currentIndex=-1;
    public TableRow row;
    SensorDataProvider (String file) 
    {
        filePath=sketchPath()+dataPath("/data/"+file);
        dataTable=loadTable(filePath, "header");
    }
    public void readNext()
    {
        currentIndex++;
        row=dataTable.getRow(currentIndex);
    }


}
