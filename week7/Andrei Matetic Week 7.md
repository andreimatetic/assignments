# Week 7 Homework: A Day in the Life of a Windows Sysadmin

**Deliverable for Task 1:** Take a screenshot of all the GPOs created for this homework assignment. To find these, launch the Group Policy Management tool, select `Group Policy Objects`, and take a screenshot of the GPOs you've created.  

![](images/Andrei Matetic Week 7-bd7158ed.png)

**Deliverable for Task 2:** Submit a screenshot of the different `Account Lockout` policies in Group Policy Management Editor. It should show the three values you set under the Policy and Policy Setting columns.  

![](images/Andrei Matetic Week 7-3013bf7e.png)

**Deliverable for Task 3:** Submit a screenshot of the different `Windows PowerShell` policies within the Group Policy Management Editor. Four of these should be enabled.

![](images/Andrei Matetic Week 7-a98d23fb.png)

**Deliverable for Task 4:** Submit a copy of your `enum_acls.ps1` script.  

```PowerShell
foreach ($item in Get-ChildItem)
{
    Get-Acl $item | Format-Table -Wrap
}
```

![](images/Andrei Matetic Week 7-3452fe01.png)

**Deliverable for Bonus Task 5:** Submit a screenshot of the contents of one of your transcribed PowerShell logs or a copy of one of the logs.  

![](images/Andrei Matetic Week 7-ac369a81.png)
