


VaultPasswordView v1.11
Copyright (c) 2016 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

VaultPasswordView is a simple tool for Windows 10/8/7 that decrypts and
displays the passwords and other data stored inside 'Windows Vault'. You
can use it to decrypt the Windows Vault data of your currently running
system, as well as the Windows Vault data stored on external hard drive.



Versions History
================


* Version 1.11:
  o Fixed the external drive feature to work properly if you sign in
    with Microsoft account.
  o Be aware that in order to decrypt Windows Vault information
    created while you signed in with Microsoft account, you have to
    provide the random DPAPI password generated for your Microsoft
    account instead of the actual login password. You can find this DPAPI
    password with the MadPassExt tool.

* Version 1.10:
  o Added new option: 'Decrypt vault files of all logged-in users'.
    This new option allows you to decrypt the Windows Vault files of
    non-administrator user without typing the password, as long as the
    user is already logged into your system.

* Version 1.08:
  o Multiple users reported about 'Invalid key file inside the
    Protect folder' error. The error message was incorrect and now it's
    displayed as 'Invalid key in policy file'. Also, added debug
    information to this error message in order to find out the cause of
    this error.

* Version 1.07:
  o Fixed bug: When VaultPasswordView failed to find any data inside
    Windows Vault, it displayed the wrong message - 'Cannot find the
    Policy.vpol file inside the vault folder' instead of 'Cannot find any
    .vcrd file inside the vault folder'.

* Version 1.06:
  o Fixed the lower pane to switch focus when pressing tab key.

* Version 1.05:
  o VaultPasswordView now allows you to decrypt the data stored
    inside Windows Vault of the current user without supplying the login
    password and other information. This feature requires elevation (Run
    As Administrator) and on 64-bit systems you must use the 64-bit
    version of VaultPasswordView.

* Version 1.01:
  o Fixed bug: VaultPasswordView detected the user profile folder
    incorrectly.

* Version 1.00 - First release.



System Requirements
===================


* This utility works on any version of Windows, starting from Windows 7
  and up to Windows 10. Both 32-bit and 64-bit systems are supported. Be
  aware that this tool is not very useful on Windows 7, simply because
  Microsoft started to use the Windows vault for storing IE and Windows
  mail passwords only from Windows 8.
* You can also use this tool on Windows XP with SP3 for decrypting the
  Windows Vault of external drive with Windows 10/8/7.



Passwords And Data Stored by Windows Vault
==========================================


* Passwords of Internet Explorer 10.0/11.0 and Microsoft Edge running
  under Windows 8 or later. (Be aware that IE10/IE11 under Windows 7
  doesn't use the Windows Vault to store passwords).
* Login Information of Windows Mail application (Windows 8 or later).



Windows Vault Location
======================

Windows vault files are stored in the following folders:
* C:\Users\[User Profile]\AppData\Local\Microsoft\Vault
* C:\ProgramData\Microsoft\Vault
* C:\Windows\system32\config\systemprofile\AppData\Local\Microsoft\Vault
Inside these vault folders, there is Policy.vpol filename that contains
the encryption key. The encryption key is used to decrypt the .vcrd files
in the same vault folder.



Notice For Windows 7 Users
==========================

The term 'Windows Vault' is somewhat confusing because the passwords
displayed by Windows 7 as Windows Vault are actually stored inside
Credentials files. So if you have Windows 7 and you want to recover the
passwords listed in the 'Windows Vault' window you should actually use
the following tools: Network Password Recovery or CredentialsFileView



Start Using VaultPasswordView
=============================

VaultPasswordView doesn't require any installation process or additional
DLL files. In order to start using it, simply run the executable file -
VaultPasswordView.exe

After running VaultPasswordView, the 'Vault Decryption Options' window is
displayed. VaultPasswordView automatically fills the correct folders of
your current running system and current logged-on user. The only field
you have to fill by yourself is the 'Windows Login Password', the login
password is needed in order to decrypt the Windows vault files.
You can also decrypt the data of Windows Vault of the current logged-on
user without providing the login password if you choose the 'Decrypt
vault files of the current user' option in the top combo-box. This
feature requires elevation (Run As Administrator) and also you must use
the 64-bit build of VaultPasswordView if you have 64-bit version of
Windows.

If you have multiple logged-in users (For example: non-administrator user
that owns the vault data you want to decrypt, and Administrator user that
you use for the elevation of VaultPasswordView), you should choose the
'Decrypt vault files of all logged-in users' option.

If you want to decrypt the Windows vault files of external drive, you can
manually fill the correct folders on your external drive, or
alternatively you can choose the root folder of your external drive and
then click the 'Automatic Fill' button.

After clicking the 'Ok' button of the 'Vault Decryption Options' window,
VaultPasswordView scans the files inside the vault folders, decrypts them
and then displays the result in the main window. The upper pane of the
main window displays the list of all decrypted .vcrd files. When
selecting an item in the upper pane, the lower pane displays the entire
decrypted data in Hex-Dump format. If the decrypted data contains a
password or other text, this text is also displayed in the 'Item Value'
column on the upper pane.



Run As Administrator
====================

By default, VaultPasswordView doesn't request elevation (Run As
Administrator) when running it. However, if you have vault files
encrypted with a system key - you have to run VaultPasswordView as
Administrator in order to decrypt these vault files. You can run
VaultPasswordView as administrator by pressing Ctrl+F11.



Translating VaultPasswordView to other languages
================================================

In order to translate VaultPasswordView to other language, follow the
instructions below:
1. Run VaultPasswordView with /savelangfile parameter:
   VaultPasswordView.exe /savelangfile
   A file named VaultPasswordView_lng.ini will be created in the folder
   of VaultPasswordView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run VaultPasswordView, and all
   translated strings will be loaded from the language file.
   If you want to run VaultPasswordView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
