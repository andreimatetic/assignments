# Week 2 Homework: Assessing Security Culture

### Scenario  

Employees at SilverCorp are increasingly using their own personal devices for company work.  
- Specifically, over half of all employees check their work email and communications via Slack on their personal mobile phones.
- Another 25% of employees are doing other work-related activities using work accounts and work-related applications on their personal phone.
- Allowing sensitive work information to be shared on employees’ personal devices has a number of security implications.
- You must research these security risks and use the security culture framework to develop a plan to mitigate the concerns.

### Step 1: Measure and Set Goals  
1. Using outside research, indicate the potential security risks of allowing employees to access work information on their personal devices. Identify at least three potential attacks that can be carried out.  
    - Inappropriate disclosure of confidential information [if someone other than employee uses the phone, shoulder surfing (more plausible with a tablet),captured over insecure wifi, exfilrtated by mobile malware]  
    - Ransomware encrypting the phone or tablet  
    - Malware using the phone as a pivot point into the corportate network

2. Based on the above scenario, what is the preferred employee behavior?  
    - Unless an approved MDM (mobile device management) solution is installed, personal phones or tablets are not to be used to access work email and applications. Alternatively, a corporate issued device may be used (configured with MDM and remote wipe). Corporate material, regardless of classification, is not to be shared across Slack (use an aprroved file sharing service).  

3. What methods would you use to measure how often employees are currently not behaving according to the preferred behavior?  
    - Phising tests that also collect device information to correlate against employee assest data [was this opened on a personal device?]
    - Seed Slack and other applications with canary token files. Were they downloaded and opened?

4. What is the goal that you would like the organization to reach regarding this behavior?  
    - reduce non-MDM personal device use to zero by year end.  

### Step 2: Involve the Right People  
- Indicate at least five employees or departments that need to be involved. For each person or department, indicate in 2-3 sentences what their role and responsibilities will be.  
    1. C-suite (CEO,CIO, and CISO if there's one): Direction needs to come from the top (bottom up change does not work). The _C people_ are liable (i.e. sueable) for compliance failures.    
    2. Human Resources: maintaining employee compliance records and disciplinary records. Handles employee separation.
    3. IT: reponsible for implementing decided technical controls
    4. Education: Responsible for either developing and delivering training or determing what preexisting training solution to use.
    5. Line management: responsible for their direct reports completing the training and fielding their questions.  

### Step 3: Training Plan  
Training is part of any security culture framework plan. How will you train your employees on this security concern? In one page, indicate the following:

- How frequently will you run training? What format will it take? (i.e. in-person, online, a combination of both)  
    A: At a minimum annually and as part of new employee onboarding.  Refresher training as needed (e.g. fail rate ticks above threshold or after an incident).  An in person or video intro might help set the right tone (especially if SilverCorp had expericenced any recent incidents) 
- What topics will you cover in your training and why? (This should be the bulk of the deliverable.)  
    - summary of current behavior  
    - current event examples (especially if they happened at SilverCorp) of what can go wrong  
    - new policy going forward  
    - review techniques to help identify phishes. touch on the psychology involved.
    
- After you’ve run your training, how will you measure its effectiveness?   
    As mentioned above in **Step 1 #3**, use phising tests to determin if and where (device wise) the phish is opened. 