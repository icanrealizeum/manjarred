											Revision : 02
----------------------------------------------------------------------------------------------------
Software name		Patch to resolve language (FR / SV /DK) unmatch isse for Device Stage 3.2

Supported models	
			Think Pad 
			Think Station 

Operating system	 Microsoft Windows 7 operating system

Version			1.1

----------------------------------------------------------------------------------------------------
WHAT THIS PACKAGE DOES

The package will provide the updated metadata to Device Stage 3.2 to resovle the language unmatch issue.

----------------------------------------------------------------------------------------------------
CHANGES IN THIS RELEASE
Version 1.1

[Important updates]        
-None

[New Functions or Enhancements]
-None

[Problem(s) fixed]
- Lenovo Thinkvantage Tools is not Localized for FR Win7 OS, it's ENG now.
- Lenovo Thinkvantage Tool is not Localized on SV and DK language.

----------------------------------------------------------------------------------------------------
DETERMINING WHICH VERSION OF PATCH TARGET IS INSTALLED


----------------------------------------------------------------------------------------------------
SYSTEM REQUIREMENTS
  - Windows 7 operating system
  - Device Stage 3.2
  - Latest version of the BIOS
  - 1.5 GB of free hard disk drive space
  - 512 MB of memory (recommended)
  - Upgrade and compatibility: None 
  
----------------------------------------------------------------------------------------------------
INSTALLATION INSTRUCTIONS
Note: To determine whether you should apply the patch, refer to the VERSION INFORMATION section.

Manual installation
To download and install the patch on your computer manually, do the following:

Note: This section assumes to use the Internet Explorer Web browser and Windows Explorer.

1. Click the file link for the executable on the Web page.
2. When prompted, select a drive and directory to save and extract the executable.
3. Locate the folder where the executable was extracted.
4. Double-click the executable and follow the instructions on the screen to complete the installation.
   Note: During the installation process, make sure to select the checkbox next to 
         "Run lds_update_language after Finish", and then click Finish.
5. Restart your computer.

Unattended installation
To perform unattended installation, do the following:

Note: The unattended installation can only be performed by system administrators.
 
1. Click the file link for the executable on the Web page.
2. When prompted, select a drive and directory to save and extract the executable.
3. Locate the folder where the executable was extracted.
4. Double-click the executable and follow the instructions on the screen.
5. Make sure not to select the checkbox next to Run FireFoxFix after Finish, 
   and then click Finish to cancel the installation process.
6. At the command line, execute the lds_update_language.exe file with the following option:
       /Silent
   For example:
     [Path where the files were extracted]\lds_update_language.exe /Silent

----------------------------------------------------------------------------------------------------
UNINSTALLATION INSTRUCTIONS

This package does not support uninstalling the patch.

----------------------------------------------------------------------------------------------------
VERSION INFORMATION
 
The following versions have been released to date.
 
  Version	Rev.	Issue date
  -------	----	---------------
  1.01		01	    2012-08-21
 
Note: Revision number (Rev.) is for the administrative purpose of this README document 
and is not related to the software version. There is no need to upgrade this software 
when the revision number changes.
 
To check the version of the program, refer to the section of Determining which version 
of the patch should be installed.
 
 
Summary of changes
 
  Where: <   >        Version number
         [Important]  Important update
         (New)        New function or enhancement
         (Fix)        Correction to existing function
 
<1.1>
  - (Fix) Fixed the problem that the password auto-fill feature does not work on the German version 
          of the Windows operating system.
  - (Fix) Fixed the issue that the Password Manager program does not work when logging on 
          the Web site at www.wellsfargo.com.
<1.0>
  - (New) (Initial Release) Initial patch that supports the Mozilla Firefox 4 Web browser and later version.

----------------------------------------------------------------------------------------------------
REFERENCE INFORMATION
 
  None
 
----------------------------------------------------------------------------------------------------
 
 
----------------------------------------------------------------------------------------------------
LIMITATIONS

The patch will only support the fix to below languages.
	- FR (French)
	- SV (Swedish)
	- DK (Danish)
----------------------------------------------------------------------------------------------------
TRADEMARKS
 
The following terms are trademarks of Lenovo in the United States, other countries, or both:
ThinkCentre
ThinkPad
ThinkVantage


Microsoft, Windows, and Windows NT are trademarks or registered trademarks of Microsoft Corporation 
in the United States, other countries, or both.
 
Other company, product, and service names may be trademarks or service marks of others.
 
LENOVO PROVIDES THIS PUBLICATION "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS 
FOR A PARTICULAR PURPOSE.

Some jurisdictions do not allow disclaimer of express or implied warranties in certain transactions, 
therefore, this statement may not apply to you. This information could include technical inaccuracies or 
typographical errors. Changes are periodically made to thinformation herein; these changes will be incorporated 
in new editions of the publication. Lenovo may make improvements and/or changes in the product(s) 
and/or the program(s) described in this publication at any time without notice.

BY FURNISHING THIS DOCUMENT, LENOVO GRANTS NO LICENSES TO ANY PATENTS OR COPYRIGHTS. 
(C) Copyright Lenovo 2006, 2012. All rights reserved.
