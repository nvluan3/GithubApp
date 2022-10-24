


CredentialsFileView v1.11
Copyright (c) 2016 - 2021 Nir Sofer
Web site: https://www.nirsoft.net



Description
===========

CredentialsFileView is a simple tool for Windows that decrypts and
displays the passwords and other data stored inside Credentials files of
Windows. You can use it to decrypt the Credentials data of your currently
running system, as well as the Credentials data stored on external hard
drive.



System Requirements
===================

This utility works on any version of Windows, starting from Windows XP
and up to Windows 10. Both 32-bit and 64-bit systems are supported.



Versions History
================


* Version 1.11:
  o Fixed the external drive feature to work properly if you sign in
    with Microsoft account.
  o Be aware that in order to recover credentials passwords created
    while you signed in with Microsoft account, you have to provide the
    random DPAPI password generated for your Microsoft account instead of
    the actual login password. You can find this DPAPI password with the
    MadPassExt tool.

* Version 1.10:
  o Added 2 new options: 'Decrypt Credentials files of another logged
    in user' and 'Decrypt Credentials files of all logged in users'.
  o These new options allow you to decrypt the credentials files of
    non-administrator users without typing their password, as long as the
    user is already logged into your system.

* Version 1.07:
  o Fixed bug: 'Copy Selected Items' worked improperly when setting
    the 'Unicode/Ascii Save Mode' to 'Always UTF-8'.

* Version 1.06:
  o Fixed the lower pane to switch focus when pressing tab key.

* Version 1.05:
  o CredentialsFileView now allows you to decrypt the data stored
    inside Windows Credentials files of the current user without
    supplying the login password and other information. This feature
    requires elevation (Run As Administrator) and on 64-bit systems you
    must use the 64-bit version of CredentialsFileView.

* Version 1.00 - First release.



Data Stored In Credentials Files
================================

Windows operating system stores the following information inside
Credentials files:
* Login passwords of remote computers on your LAN.
* Passwords of mail accounts on exchange server (stored by Microsoft
  Outlook)
* Windows Live session information.
* Remote Desktop 6 user\password information.
* Internet Explorer 7.x and 8.x: passwords of password-protected Web
  sites ("Basic Authentication" or "Digest Access Authentication")
* Password of MSN Messenger / Windows Messenger accounts



Credentials File Location
=========================

You can find the Credentials files of Windows in the following locations:
* C:\Users\[User Profile]\AppData\Roaming\Microsoft\Credentials
  (Windows Vista and later)
* C:\Users\[User Profile]\AppData\Local\Microsoft\Credentials (Windows
  Vista and later)
* C:\Windows\system32\config\systemprofile\AppData\Local\Microsoft\Creden
  tials (Windows 8 and later)
* C:\Documents and Settings\[User Profile]\Application
  Data\Microsoft\Credentials (Windows XP)
* C:\Documents and Settings\[User Profile]\Local Settings\Application
  Data\Microsoft\Credentials (Windows XP)



Start Using CredentialsFileView
===============================

CredentialsFileView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - CredentialsFileView.exe

After running CredentialsFileView, the 'Credentials Decryption Options'
window is displayed. CredentialsFileView automatically fills the correct
folders of your current running system and current logged-on user. The
only field you have to fill by yourself is the 'Windows Login Password',
the login password is needed in order to decrypt the Credentials files of
Windows.

You can also decrypt the Credentials files of the current logged-on user
without providing the login password if you choose the 'Decrypt
Credentials files of the current user' option in the top combo-box. This
feature requires elevation (Run As Administrator) and also you must use
the 64-bit build of CredentialsFileView if you have 64-bit version of
Windows.

If you have multiple logged-in users (For example: non-administrator user
that owns the Credentials data you want to decrypt, and Administrator
user that you use for the elevation of CredentialsFileView), you should
choose the 'Decrypt Credentials files of all logged in users' option. You
can also choose the 'Decrypt Credentials files of another logged in user'
option and then choose the correct user who has the Credentials files you
want to decrypt.

If you want to decrypt the Credentials files stored on external drive or
inside another user profile on your current system, you can manually fill
the correct folders of your external drive or the other user profile, or
alternatively you can choose the root folder of your external drive and
then click the 'Automatic Fill' button.
If the external profile was used with Microsoft account, you have to
provide a secret random password generated for your account instead of
the actual sign-in password. You can find this secret password with the
MadPassExt tool.

After clicking the 'Ok' button of the 'Credentials Decryption Options'
window, CredentialsFileView scans the Credentials files inside the
specified folders, decrypts them and then displays the result in the main
window.



The Upper Pane
==============

The upper pane of the main window displays the list of all entries found
inside the Credentials files. Be aware that in Windows Vista and later,
every entry is stored in a separated Credentials file, but on Windows XP
a single Credentials file stores multiple entries.
Here's the description of the columns in the upper pane table:
* Filename:Name of the Credentials file.
* Version:Credentials file version - XP or Vista/7/8/10.
* Decrypted Size:Total size of the decrypted data.
* Modified Time:Modified time of the Credentials entry.
* Entry Type:Type of entry - Generic, Domain Password, Certificate,
  .NET Passport, Generic Certificate, Domain Extended.
* Persist:Session, Local Machine, or Enterprise.
* Entry Name:The name of the Credentials entry.
* User Name:User name found inside the Credentials entry.
* Password:Password found inside the Credentials entry.
* Full Path:Full path of the Credentials file.
* File Size:Size of the Credentials file.
* File Modified Time:Modified time of the Credentials file.
* File Created Time:Created time of the Credentials file.



Lower Pane Mode
===============

When selecting an item in the upper pane, the lower pane displays the
decrypted data of the Credentials file. There are 2 modes to display the
decrypted data (You can change it from Options -> Lower Pane Mode ):
* Full Hex Dump: Displays the entire decrypted data in hex-dump format.
* Strings Only: Displays all strings found in the decrypted data. The
  string index is displayed in square brackets.



Run As Administrator
====================

By default, CredentialsFileView doesn't request elevation (Run As
Administrator) when running it. However, if you want to decrypt a system
Credentials file stored in
C:\Windows\system32\config\systemprofile\AppData\Local\Microsoft\Credential
s then you have to run CredentialsFileView as administrator, and you can
do it easily by pressing Ctrl+F11. This kind of system Credentials file
is created only on Windows 8 and later systems.



Translating CredentialsFileView to other languages
==================================================

In order to translate CredentialsFileView to other language, follow the
instructions below:
1. Run CredentialsFileView with /savelangfile parameter:
   CredentialsFileView.exe /savelangfile
   A file named CredentialsFileView_lng.ini will be created in the folder
   of CredentialsFileView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run CredentialsFileView, and all
   translated strings will be loaded from the language file.
   If you want to run CredentialsFileView without the translation, simply
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
