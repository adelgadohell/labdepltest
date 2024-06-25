# Collect OS Details Laboratory

## About this Lab
- This course/module was created to Collect OS details.
- It will take approximately 30 minutes.
- This module introduces you to the tools to collect OS details.
- This Lab provides hands-on activities.
- After this course/module you will be able to:
  - Create sos or supportconfig reports
  - Enable specific modules
  - Cope with not enough space issues

## Collect OS Lab

### Instructions

1.  Deploy a Red Hat VM using the link below, please fill the empty options as resource group for example:
  
  [![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/collect-OS-details/Labs/CollectOSDetails-Lab1RHEL.json)

2.  Deploy a SuSE VM using the link below, please fill the empty options as resource group for example:

  [![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/collect-OS-details/Labs/CollectOSDetails-Lab1SuSE.json)

#### At the Red Hat VM:

  1. Check whether the sos package is installed, if not install it.

  2. Switch to root account and generate a sosreport:

         sosreport

     - Review what plugins are currently enabled/disabled
     
                   sosreport -l

     - What plugins are available
     - Edit the sosreport configuration file /etc/sos/sos.conf
     - Disable SELinux plugin
     - Run sosreport again and compare size and contents with previous report.

  3. Generate a new report with Azure plugin:

         sosreport -e azure

     - At the end of the command execution, the output will show you a file name inside the /var/tmp path that start with "sosreport-<something-variable>".  That's a tar.xz file.  Review the report and contents of it.   To do that you need to decompress information of the tar.xz file with command:

             tar xvf <sosreport-file-path>
     
      After the command execution it will create a directory and inside it will have the collected WALinuxAgent information. You can review it with your preferred commands.  The Azure plug-in module collects WALinuxAgent log and configuration details.

  4. Generate a report with all logs:

     - Edit the sosreport configuration file /etc/sos/sos.conf
     - Enable SELinux plugin
     - Run the report:

           sosreport --all-logs
       
     - Compare the size of the original sosreport archive with this one. (Hint:  ls -l provides you more detailed information on the files)
     - If you ran out of space, use the _--tmp-dir_ option to specify an alternate location.

#### At the SuSE VM: 

  1.  Switch to root account and install the supportutils package:

          zypper install supportutils
      
  2.  Generate a report:

          supportconfig

      - Review the contents of the archive generated. Review the contents of several of the *.txt files created.

  3. Run a report with the minimal option:

         supportconfig -m

      - Compare the size with the original archive.

  4. Run a report again limiting the report to the BOOT topic:

         supportconfig -i BOOT

      - Review the information generated.

#### Any of the VMs created. 

  1. Select one of the 2 VMs created on this Lab.
  2. On the Portal, use the Serial Console to access the OS.
  3. Use boot diagnostics to review the Serial Log.
  4. Compare the information in the boot.txt file generated in the SLES supportconfig to the equivalent in the Red Hat sosreport. 

     

