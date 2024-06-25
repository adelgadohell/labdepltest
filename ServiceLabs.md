# Service Troubleshooting 

### About this Lab

- This lab was created for Azure Linux Academy Specialist
- It will take approximately ninety(90) minutes.
- This lab has two activities:
      - A troubleshooting activity to exercise break-fix work on systemd-based services.
      - A productive activity to practice systemd unit creation.

## Lab 1 : Service Troubleshooting

Duration 30~45 minutes. If you do not make significant progress in 15 minutes, please contact your instructor for hints. 

### Instructions

1. Deploy one RHEL VM using the link below:

[![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/service_troubleshooting/Labs/service-lab1.json)

2. Confirm you can connect to the VM using Serial Console.

3. Try to connect to the VM using SSH protocol with any client you prefer.   You'll find it is not working.
  
4. At this point, the VM is broken.  Your objective is to troubleshoot and fix whatever is broken.


## Lab 2: Unit Production

Duration 30~45 minutes.  If you do not finish this excersise in time, please let your instructor know.

### Instructions

>  In this exercise you will deploy one SuSE VM using the link below:

[![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/service_troubleshooting/Labs/service-lab2.json)

> Using systemd units, a web server needs to be run on port 8080 for only five minutes every hour.  This should be set up without using cron.
   
> You can use this python line to run a simple web server:

            /usr/bin/python3 -m http.server 8080

> Share your solution with the class. 