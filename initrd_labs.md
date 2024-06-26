# Greater Insight Initrd Lab

## About this Lab


- This Lab was created for Greater Insight Initrd.
- It will take approximately 60 minutes 
- This lab has three activities:
  
> 1. Fix VM noboot issue caused by corrupt initrd/initramfs.
> 2. Fix VM noboot issue caused by missing hv_storvsc of LIS driver in initrd/initramfs.
> 3. Fix VM noboot issue caused by missing LIS driver in initrd/initramfs.


## Lab 1: Fix VM no boot issue caused by corrupt initrd/initramfs

### Instructions
1. Deploy a broken Red Hat VM using the link below: 

  [![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/Labs/Lab01.json)

2. Check on the VM Serial Console log and Boot Diagnostics screenshot and Serial log to confirm the no-boot status.  VM is in a non-boot scenario due to corrupt initramfs/initrd for current kernel. You'll find a screen with a kernel panic, example: 
    ![initramfs file_corrupted](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/images/initramfs-lab1-error.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)

3. Create a Repair VM and attach an OS disk copy of damage VM as data disk.
4. Create and connect to a chroot environment following the public documentation: [Chroot environment in a Linux rescue VM](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/chroot-environment-linux)
5. Take a backup of current iniramfs/initrd file using command **cp**
6. Rebuild initramfs, remember to keep the appropiate path while executing this command:

   `# dracut -f -v initramfs-<kernel=version>.img <kernel-version>`
   
7. Exit chroot environmet and umount OS disk copy, then proceed to swap the OS disk in the failing VM.
8. Start the VM and verify the VM is booting as expected.

**NOTE:**  Another way to fix this scenario is using ALAR scripts you can find more information here: [Use Azure Linux Auto Repair (ALAR) to fix a Linux VM](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/repair-linux-vm-using-alar)


## Lab 2: Fix VM noboot issue caused by missing hv_storvsc of LIS driver in initrd/initramfs
### Scenario

On this Lab the hv_storvsc driver has been removed from the Initrd configuration.

Your task is to set a repair VM to fix the situation.

Once you've added the missing driver into the Initrd configuration file, make the necessary configuration changes to ensure the VM boots up properly.

### Symptom

![initramfs driver_missing](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/images/initramfs-lab2-error.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)

### Instructions

1.  Deploy a broken Red Hat VM using the link below:

  [![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/Labs/Lab02.json)

2. Check in Serial Console log and Boot Diagnostics that VM is in a non-boot scenario and check on the error.
3. Create a Repair VM environment and attach a OS disk copy to this environment as data disk.
4. Create and connect to a chroot environment following the public documentation: [Chroot environment in a Linux rescue VM](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/chroot-environment-linux)
5. Create a backup of the problematic initramfs using command *cp*
6. Modify configuration file and comment out the line that says "omit_drivers+=" hv_storvsc " and add the add_drivers line like below.  Then, proceed to rebuild the initrd file for the current kernel using the command below (*Remember to include the correct path on the command*):
 
          #vi /etc/dracut.conf
          add_drivers+=" hv_storvsc "
          #dracut -f -v <initramfsversion> <kernelversion>

7. Exit chroot and unmount the OS disk copy from the troubleshooting VM, after you've done that, reassemble the original VM by switching the OS disk.

8. The VM should be now able to boot after Initrd configuration gets changed.

## Lab 3: Fix VM non-boot issue caused by missing of all LIS driver in Initrd

### Symptom

![initramfs driver_missing](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/images/initramfs-lab3-error.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)

### Instructions
1. Deploy one broken Red Hat VM using the link below:

 [![Click to deploy](https://dev.azure.com/LinuxNinjas/aa969835-d5b5-4c66-a74c-74d1f9d57eed/_apis/git/repositories/16b54735-533f-46a2-a894-32099518c4eb/items?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/deploy_azure_image.png&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0)](https://labboxprod.azurewebsites.net/api/labbox?url=https://dev.azure.com/LinuxNinjas/Azure%20Linux%20Academy%20-%20CSS/_git/AzureLinuxAcademy?path=/Azure%20Linux%20Academy/Azure_Linux_Specialist_Self_Paced/vm-recover_and_initrd/Labs/Lab03.json)

2. Check in Serial Console log and Boot Diagnostics that VM is in a non-boot scenario and check on the error.
3. Create a Repair VM environment and attach a OS disk copy to this environment as data disk.
4. Create and connect to a chroot environment following the public documentation: [Chroot environment in a Linux rescue VM](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/chroot-environment-linux)
5. Modify configuration file and delete or comment out the line that says "omit_drivers+=" hv_vmbus hv_netvsc hv_storvsc " and add the line add_drivers as explained below.  Then, proceed to rebuild the initrd file for the current kernel using the command below (*Remember to include the correct path on the command*):
 
          #vi /etc/dracut.conf
          add_drivers+=" hv_vmbus hv_netvsc hv_storvsc "
          #dracut -f -v <initramfsversion> <kernelversion>

6. Exit chroot and unmount the OS disk copy from the troubleshooting VM, after you've done that, reassemble the original VM by switching the OS disk.

8. The VM should be now able to boot after Initrd configuration gets changed.

