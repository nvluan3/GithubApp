1) Install Autodesk Application - Do Not Start it yet 

2) Install the Autodesk network license manager (v11.19.4) from crack folder (NLM.msi Update 8) 
    -Default install is "C:\Autodesk\Network License Manager"
    -Stop any running instance (lmgrd, adskflex) if you have one
    -Replace adskflex.exe by cracked one
 
3) Replace the version.dll - \Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing\Current\AdskLicensingAgent\

4) Edit lic.dat and change HOSTNAME and MAC to suit your configuration (if you are not sure start LMTOOLS Utility and go to 
   System Settings, your HOSTNAME and MAC will be listed)
   You can change vendor port too and add your previous licenses of course :)
   Save lic.dat where you want (we suggest to "C:\Autodesk\Network License Manager" folder)


5) You have 2 options:
    1)Start Network License Manager manually :
    Run the license manager with "lmgrd.exe -z -c lic.dat" from "C:\Autodesk\Network License Manager" folder
    Or  
    2)Create a Service: (suggested)
     Start LMTOOLS Utility (lmtools.exe GUI) from "C:\Autodesk\Network License Manager" folder
   - in 'config services', add a "Autodesk' service name
                           choose C:\Autodesk\Network License Manager\lmgrd.exe for path to lmgrd
                           choose X:\path\where\you\saved\lic.dat for path to license file
                           choose a empty file to have debug logs (optional)
                           tick 'start server at power up' and 'use services'
                           Click Save
   - in 'service/license file' choose configuration using services and tick 'ignore license file path env var" (dont click that if you 
                               you wanna use a ditributed licensing .. or you will have to edit or create a Licpath.lic file)                 
   - in 'start/stop/read' click 'start server'
                          click 'rereadlicense file'
   - in 'server status' click 'perform status enquiry'   
                        check that you have 'adskflex: UP v11.18.0'
                        check features are activated : Users of 87545ACD_2022_0F:  (Total of 100 licenses issued;  Total of 0 licenses in use) for example
   - in 'server diags' check all featured can be checked out 
   - check logs also win 'config services' if you configured it

7) Start Your Autodesk Application
   - When prompted select "Use a network license"
   - Select "Single license server"
   - Use 127.0.0.1, localhost or where the flexlm daemon is installed (syntax could be port@server). 


NOTE: in some cases after restart your computer still requires license path go in services.msc and make autodesk license server run automatic mode.
NOTE: This is mixed Magnitude - xforce i made so welcome use it as you like.

   

########################################
TOTAL domination again for your pleasure
Smoke it!
########################################



You Could also set a distributed license system, having one machine serving them all

For that matter
you need to Set the ADSKFLEX_LICENSE_FILE environment variable on the client machine (the procedure varies depending on the operating system). 

To set the environment variable

Use the procedure described for your operating system to set the environment variable:

For Windows 7/8/10: 

    Right-click Computer and click Properties, or, in the Control Panel select System and Maintenance > System
    Click Advanced system settings and select the Advanced tab.
    Click Environment Variables.
    In the Environment Variables dialog box, under System Variables, click New.
    In the New System Variable dialog box, enter ADSKFLEX_LICENSE_FILE in the Variable Name field.
    In the Variable Value field, enter an at sign (@) followed by the host name of each license server to which you want to point the client. Separate each server name with a semicolon (;). For example:

    @server1;@server2;@server3

Dont forget to open your firewall, you may also need to check the LICPATH.LIC file in root of the installed application in case you have issues


If you still want to use 2018-19-20-21 applications, simply add their features with the corrected signature into our new lic.dat license file.
 
Block hosts:
127.0.0.1	genuine-software.autodesk.com
127.0.0.1	genuine-software1.autodesk.com
127.0.0.1	genuine-software2.autodesk.com
127.0.0.1	ase.autodesk.com
127.0.0.1	ase-cdn-stg.autodesk.com


=================
www.downloadly.ir