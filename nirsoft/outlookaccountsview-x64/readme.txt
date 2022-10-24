


OutlookAccountsView v1.01
Copyright (c) 2020 - 2022 Nir Sofer
Web site: https://www.nirsoft.net/utils/outlook_accounts_view.html



Description
===========

OutlookAccountsView is a password recovery tool for Windows that displays
the details of all POP3/IMAP/SMTP accounts stored in your Outlook
profiles. For every account, the following information is displayed:
Account Name, Display Name, Email, User Name, Password, Profile Name,
Server Address, Server Type, Server Port, Registry Key, Windows User, and
PST files used for this account.
You can extract the Outlook accounts information of the current user,
from external disk plugged to your computer, and from remote computer on
your network.



System Requirements
===================

This tool works on any version of Windows, starting from Windows XP and
up to Windows 11. Both 32-bit and 64-bit systems are supported.
This tool works with any version of Microsoft Outlook, starting from
Outlook 2007 and up to Outlook 2019.
In order to recover the mail passwords from external disk or remote
computer, you have to provide your login password.



Version History
===============


* Version 1.01:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option (Turned
    on by default).
  o Added option to choose another font (name and size) to display in
    the main window.

* Version 1.00 - First release.



Start Using OutlookAccountsView
===============================

OutlookAccountsView doesn't require any installation process or
additional DLL files. In order to start using it, simply run the
executable file - OutlookAccountsView.exe
After running OutlookAccountsView.exe, the 'Advanced Options' window is
opened, and then you can choose to load the Outlook accounts list from
your current user, from remote system, or from external hard drive. If
you choose to load the Outlook accounts list from external drive or
remote computers, you have the fill more fields in order to decrypt the
mail passwords.
After choosing the desired option, click the 'OK' button, and
OutlookAccountsView will displays your Outlook accounts in the main
window.
You can select one or more mail accounts (or press Ctrl+A to select all)
and then export the list to comma-delimited/tab-delimited/HTML/XML/JSON
file by using the 'Save Selected Items' option (Ctrl+S). You can also
copy the accounts list to the clipboard (Ctrl+C) and then paste them to
Excel or other application.



Recover Outlook accounts from external disk
===========================================

If you want to recover the passwords and other details of Outlook mail
accounts stored on external disk plugged to your computer, choose
'External Disk' in the 'Load From' combo-box, and then type the
ntuser.dat Registry file of the user (e.g: G:\Users\user10\ntuser.dat ).
If you want to recover the email passwords, you also have to provide the
Protect folder of the user profile (e.g:
G:\Users\user10\AppData\Roaming\Microsoft\Protect ) and the login
password of the user. You can also use the SHA1 hash of the login
password instead of the password itself.
If Microsoft account was used to login, you have to extract the actual
decryption password with the MadPassExt tool and then paste this password
into the login password field.

You may also need to run this tool as Administrator (Ctrl+F11) in order
to allow it to read the files from the user profile. If
OutlookAccountsView cannot read the files, error message will be
displayed in the bottom status bar.



Translating OutlookAccountsView to other languages
==================================================

In order to translate OutlookAccountsView to other language, follow the
instructions below:
1. Run OutlookAccountsView with /savelangfile parameter:
   OutlookAccountsView.exe /savelangfile
   A file named OutlookAccountsView_lng.ini will be created in the folder
   of OutlookAccountsView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run OutlookAccountsView.exe, and
   all translated strings will be loaded from the language file.
   If you want to run OutlookAccountsView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via CD-ROM, DVD, Internet, or in any other way,
as long as you don't charge anything for this and you don't sell it or
distribute it as a part of commercial product. If you distribute this
utility, you must include all files in the distribution package, without
any modification !



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
utility, you can send a message to support@nirsoft.net
