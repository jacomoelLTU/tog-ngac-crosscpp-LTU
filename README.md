# tog-ngac-crosscpp
TOG's implementation of the NGAC Policy Machine with minor modifications from various students at Luleå University of Technology 



HÄR SKRIVER EMIL TILLFÄLLIG TEXT
There is currently two scripts called **quickStart1.sh** and **quickStart2.sh** these have been created to make life more easy for the one who wants to quickly get evrey piece of the system running. 

The scripts have a certain order within the **.sh** file, these are in decending order as the commands come. There is also importand to run these files in order; 1. **quicStart1.sh** 2. **quickStart2.sh**. There is also some importance to which tabs should be run and when. But a good rule of thumb would be to run them **left** to **right**. Also while running **quickStart1.sh** one should know that when the coresystem tab is running there should be some delay before starting **quickStart2.sh**, about 30 secconds should be enough. 

When everything is running theese could also be of help for understanding some connections between the system. One can look in these files and get a understanding of which system depend on another. Note that within both of these files there is filepaths to each file and also which file; this is usefull and important to know if another **.pl** file wants to be used. The **.pl** file could be thought as the current policy that we load onto the **policy-server** when running **demo.sh** in **quickStart2.sh**. 
