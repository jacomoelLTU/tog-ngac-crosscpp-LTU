# tog-ngac-crosscpp
TOG's implementation of the NGAC Policy Machine with minor modifications from various students at Luleå University of Technology 



HÄR SKRIVER EMIL TILLFÄLLIG TEXT

There is currently two scripts called **quickStart1.sh** and **quickStart2.sh** these have been created to make life more easy for the one who wants to quickly get evrey piece of the system running. 

The scripts have a certain order within the **.sh** files, these are in decending order as the commands come. There is also importand to run these files in order; 1. **quicStart1.sh** 2. **quickStart2.sh**. There is also some importance to which tabs should be run and when. But a good rule of thumb would be to run them **left** to **right**. Also while running **quickStart1.sh** one should know that when the coresystem tab is running there should be some delay before starting **quickStart2.sh**, about 30 secconds should be enough. 

When everything is running theese could also be used to get a better understanding of which system depend on another. Note that within both of these files there is filepaths to each file; this is usefull and important to know if one would like for another **.pl** to be used. The **.pl** file could be thought as the current policy that we load onto the **policy-server** when running **demo.sh** in **quickStart2.sh**. 

If everything is up and running it should be possible to run the **resource-consumer**. We could then test if our policy have been loaded correctly by interacting with the terminal and in order: 

1. Run as a consumer **C**. 
2. Enter set username from chosen **.pl** file. 
3. Choose **R** (easiest way of checking we've loaded the policy). 
4. Conditional Request choice should be **no** (this is not all the way implemented yet). 

This should give a response in the same terminal window that points towards wahtever the policy is loaded correctly. 

