# Part I: Symantec
1.	What is formjacking?

    A: Symantec created the term _formjacking_ to describe malicious javascript code inserted into the checkout processing pages of shopping sites. When an order is submitted, the formjacking code copies the user and payment details and sends it to the attacker's designated server.

2.	How many websites are compromised each month with formjacking code?
 
    A: An average of 4800 websites per month

3.	What is Powershell?

    A: An object-orientated successor command line processor to `cmd.exe` in Windows. Has an associated scripting language.   

4.	What was the annual percentage increase in malicious Powershell scripts?

    A: 1000%

5.	What is a coinminer?

    A: A program or script that uses CPU (or GPU) cycles to mine a cryptocurrency (e.g. Bitcoin).

6.	How much can data from a single credit card can be sold for? 

    A: Up to $45 for a single credit card.
    
7.	How did Magecart successfully attack Ticketmaster?
 
    A: Initial access was obtained by comprimising chatbot code used for customer support. From here, Magecart was able to inject the formjacking javacript code.  
    
8.	What is one reason why there has been a growth of formjacking? 

    A: Cryptocurrency values were quite volitile in 2018. Compared to declining crypto valuation, stolen CC informaion has a more consistent rate of return.
    
9.	Cryptojacking dropped by what percentage between January and December 2018?

    A: 52%

10.	If a web page contains a coinmining script, what happens? 

    A: CPU usage on the vicitm's device increases as the additional cycles are used to mine cryptocurrency.
    
11.	How does an exploit kit work? 

    A: When the victim arrives, scanning code in the kit determines which exploit (in its bundle) best matches the victim's configuration and then serves it. 
    
12.	What does the criminal group SamSam specialize in? 

    A: Highly damaging targeted ransomware attacks
    
13.	How many SamSam attacks did Symantec find evidence of in 2018? 

    A: 67
    
14.	Even though ransomware attacks declined in 2017-2018, what was one dramatic change that occurred? 

    A: The shift of victim type from individual consumers to enterprise customers accelerated3.
    
15.	In 2018, what was the primary ransomware distribution method? 

    A: E-mail campaigns
    
16.	What operating systems do most types of ransomware attacks still target?

    A: Windows based computers
    
17.	What are “living off the land” attacks? What is the advantage to hackers? 

    A: Not an attack per say but using operating system tools (e.g. ps exec, WMI, or powershell) to comprimise additional systems after obtaining initial access.  These tools are used for legitimate administrative purposes and can blend into network traffic.
    
18.	What is an example of a tool that’s used in “living off the land” attacks?

    A: PS Exec, Windows Management Instrumentation (WMI), powershell, VB scripts
    
19.	What are zero-day exploits?

    A: Based on a zero-day vulnerability and the applicable vendor is unaware of the flaw's existence.
    
20.	By what percentage did zero-day exploits decline in 2018? 

    A: Down to 23% from 27% (in 2017). (4/27)*100  -> 14.8% decrease
    
21.	What are two techniques that worms such as Emotet and Qakbot use?

    A: 1. Dumping passwords from memory 
       2. brute-forcing access to network shares


22.	What are supply chain attacks? By how much did they increase in 2018?

    A:  Rather than directly attacking a target, supply chain attack attacks compromise 3rd party services and vendors (e.g. stealing version control credentials, stealing valid certificate credentials to sign malicious code, compromising 3rd party libraries) as a means to reach the intended target.  Increased by 78% in 2018.


23.	What challenge do supply chain attacks and living off the land attacks highlight for organizations?

    A: These arrive through trusted channels or use legitimate tools for malicous purposes.


24.	The 20 most active groups tracked by Symantec targeted an average of how many organizations between 2016 and 2018?

    A: An average of 55 organizations (up from 42 during the previous three year period).


25.	How many individuals or organizations were indicted for cyber criminal activities in 2018? What are some of the countries that these entities were from?

    A: 49  Russia, China, Iran, and North Korea


26.	When it comes to the increased number of cloud cybersecurity attacks, what is the common theme?

    A: Poorly configured cloud resources 


27.	What is the implication for successful cloud exploitation that provides access to memory locations that are normally forbidden?

    A: Shared pools of memory could result in data leaks from different cloud instances


28.	What are two examples of the above cloud attack?

    A: Meltdown and Spectre


29.	Regarding Internet of Things (IoT) attacks, what were the two most common infected devices and what percentage of IoT attacks were attributed to them?

    A: Routers & connected cameras  >90% combined


30.	What is the Mirai worm and what does it do? 

    A: A worm that instigated Distributed Denial of Service (DDoS) attacks


31.	Why was Mirai the third most common IoT threat in 2018? 

    A: Continued evolution and adding new exploits to use. Expanded target scope to include Linux servers


32.	What was unique about VPNFilter with regards to IoT threats?

    A: VPNFilter employed persistence and could survive a restart. A wide variety of payloads was supported including destructively wiping the device.


33.	What type of attack targeted the Democratic National Committee in 2019? 

    A: spear-phising [unsuccessful]


34.	What were 48% of  malicious email attachments in 2018? 

    A: Office files


35.	What were the top two malicious email themes in 2018? 

    A: Bills & Email delivery failure notifications


36.	What was the top malicious email attachment type in 2018? 

    A: `.doc` & `.dot`


37.	Which country had the highest email phishing rate? Which country had the lowest email phishing rate?

    A: Saudi Arabia `1:675` Poland `1:9653`


38.	What is Emotet and how much did it jump in 2018? 

    A: A self-propagating worm.  Up to 16% from 4% ... A 300% increase


39.	What was the top malware threat of the year? How many of those attacks were blocked?

    A: Heur.AdvML.C  Nearly 44 million


40.	Malware primarily attacks which type of operating system? 

    A: Primarily Windows based machines


41.	What was the top coinminer of 2018 and how many of those attacks were blocked? 

    A: JS.Webcoinminer  almost 2.8 million attacks blocked



42.	What were the top three financial Trojans of 2018? 

    A: Ramnit, Zbot, and Emotet


43.	What was the most common avenue of attack in 2018? 

    A: Macros in Office documents


44.	What is destructive malware? By what percent did these attacks increase in 2018? 

    A:


45.	What was the top user name used in IoT attacks? 

    A: `root`


46.	What was the top password used in IoT attacks? 

    A: `123456`


47.	What were the top three protocols used in IoT attacks? What were the top two ports used in IoT attacks? 

    A1: `telnet`, `http`, and `https`
    
    A2: `23 - telnet`  and `80 - http`


48.	In the underground economy, how much can someone get for the following? 

    a.	Stolen or fake identity:                    $0.10 - $1.50
    
    b.	Stolen medical records:                     $0.10 - $35 
    
    c.	Hacker for hire:                            $100+
    
    d.	Single credit card with full details:       $1 - $45
    
    e.	500 social media followers:                 $2 - $6
    


