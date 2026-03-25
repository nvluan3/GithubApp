chcp 65001
@echo off
:Menu
cls
echo ====================================
echo MENU CẤU HÌNH OFFICE VA WINDOWS
echo ====================================
echo Chọn một tùy chọn:
echo 1 - Bật/ Tắt Protected View (Word, Excel, PowerPoint)
echo 2 - Tăt Smart App Control
echo 3 - Chạy SFC /SCANNOW
echo 4 - Chạy DISM /RestoreHealth
echo 5 - Reset Office (chọn ứng dụng cụ thể)
echo 6 - Đặt múi giờ (UTC+07:00) Bangkok, Hanoi, Jakarta và đồng bộ thời gian (yêu cầu quyền admin)
echo 7 - Thêm máy in
echo 8 - Mở Windows Defender Firewall
echo 9 - Mở Devices and Printers
echo 10 - Cài đặt Print Management Tools
echo 11 - Đặt đơn vị đo Word sang cm
echo 12 - Active windows và office (yêu cầu quyền admin)
echo 13 - Bật/tắt Snipping Tool bằng phím Print Screen
echo 14 - Bật/tắt SmartScreen
echo 15 - Nâng cấp windows 11 Home lên Pro (yêu cầu quyền admin)
echo 16 - Mở hộp thoại Folder Options
echo 17 - Tắt bitlocker (yêu cầu quyền admin)
echo 18 - Bật/tắt Office 365 Simplified Account Creation
echo 19 - Lấy số seri máy tính
echo 20 - Lấy địa chỉ IP máy tính
echo 21 - Chạy Disk Cleanup
echo 22 - Bật/tắt Windows Firewall (yêu cầu quyền admin)
echo 0 - Thoát
echo ====================================
set /p choice=Nhập lựa chọn của bạn:
if %choice%==0 goto End
if %choice%==1 goto Luachon1
if %choice%==2 goto Luachon2
if %choice%==3 goto Luachon3
if %choice%==4 goto Luachon4
if %choice%==5 goto Luachon5
if %choice%==6 goto Luachon6
if %choice%==7 goto Luachon7
if %choice%==8 goto Luachon8
if %choice%==9 goto Luachon9
if %choice%==10 goto Luachon10
if %choice%==11 goto Luachon11
if %choice%==12 goto Luachon12
if %choice%==13 goto Luachon13
if %choice%==14 goto Luachon14
if %choice%==15 goto Luachon15
if %choice%==16 goto Luachon16
if %choice%==17 goto Luachon17
if %choice%==18 goto Luachon18
if %choice%==19 goto Luachon19
if %choice%==20 goto Luachon20
if %choice%==21 goto Luachon21
if %choice%==22 goto Luachon22

echo Lựa chọn không hợp lệ. Vui lòng thử lại.


:Luachon1
echo Chọn:
echo 1 - Bật Protected View
echo 2 - Tắt Protected View
echo 0 - Quay lại menu
set /p pvChoice=Nhập lựa chọn:
if %pvChoice%==1 (
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TrustCenter /v TrustBar /t REG_DWORD /d 1 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Common\General /v DisableBootToOfficeStart /t REG_DWORD /d 1 /F
    echo Đã bật Protected View cho Word, Excel, PowerPoint

) else if %pvChoice%==2 (
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Excel\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableAttachmentsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableInternetFilesInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Security\ProtectedView /v DisableUnsafeLocationsInPV /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TrustCenter /v TrustBar /t REG_DWORD /d 0 /F
    reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Common\General /v DisableBootToOfficeStart /t REG_DWORD /d 0 /F
    echo Đã tắt Protected View cho Word, Excel, PowerPoint
) else if %pvChoice%==0 (
    goto Menu
) 
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon1
)
goto Menu

:Luachon2
echo Đang tắt Smart App Control...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SmartAppControl" /v SACEnabled /t REG_DWORD /d 0 /f
echo Đã tắt Smart App Control.
goto Menu

:Luachon3
echo Đang chạy SFC /SCANNOW...
powershell -Command "Start-Process cmd -ArgumentList '/c sfc /scannow' -Verb RunAs"
goto Menu

:Luachon4
echo Đang chạy DISM /RestoreHealth...
powershell -Command "Start-Process cmd -ArgumentList '/c DISM.exe /Online /Cleanup-Image /RestoreHealth' -Verb RunAs"
goto Menu

:Luachon5
echo Chọn ứng dụng để reset:
echo 1 - Reset Word
echo 2 - Reset Excel
echo 3 - Reset PowerPoint
echo 0 - Quay lại menu
set /p appChoice=Nhập lựa chọn ứng dụng: 
if %appChoice%==1 (
    reg delete HKCU\SOFTWARE\Microsoft\Office\16.0\Word /f
    echo Da reset Word.
) else if %appChoice%==2 (
    reg delete HKCU\SOFTWARE\Microsoft\Office\16.0\Excel /f
    echo Da reset Excel.
) else if %appChoice%==3 (
    reg delete HKCU\SOFTWARE\Microsoft\Office\16.0\PowerPoint /f
    echo Da reset PowerPoint.
) else if %appChoice%==0 (
    goto Menu
) 
else (
    echo Lựa chọn không hợp lệ.
)
goto Menu

:Luachon6
echo Đang đặt múi giờ về (UTC+07:00) Bangkok, Hanoi, Jakarta...
powershell -Command "Start-Process cmd -ArgumentList '/c tzutil /s "SE Asia Standard Time"' -Verb RunAs"
echo Đang thực hiện đồng bộ thời gian với quyền Admin...
powershell -Command "Start-Process cmd -ArgumentList '/c w32tm /resync && net stop w32time && net start w32time' -Verb RunAs"
goto Menu

:Luachon7
echo Đang thêm máy in...
start rundll32 printui.dll,PrintUIEntry /il
goto Menu

:Luachon8
echo Mở Windows Defender Firewall...
start ms-settings:windowsdefender
goto Menu

:Luachon9
echo Mở Devices and Printers...
start shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}
goto Menu

:Luachon10
echo Đang cài đặt Print Management Console...
powershell -Command "Start-Process cmd -ArgumentList '/c dism /Online /add-Capability /CapabilityName:Print.Management.Console~~~~0.0.1.0' -Verb RunAs"
goto Menu

:Luachon11
echo Đặt đơn vị đo Word sang cm...
reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options /v RulerUnits /t REG_DWORD /d 1 /F
reg add HKCU\Software\Microsoft\Office\16.0\Word\Options /v MeasurementUnits /t REG_DWORD /d 2 /f
goto Menu

:Luachon12
echo Đang active Windows và Office...
powershell -Command "irm https://get.activated.win | iex"
goto Menu

:Luachon13
echo Chọn:
echo 1 - Bật Snipping Tool bằng phím Print Screen
echo 2 - Tắt Snipping Tool bằng phím Print Screen
echo 0 - Quay lại menu
set /p snipChoice=Nhập lựa chọn:
if %snipChoice%==1 (
    reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SnippingTool /v SnippingToolEnabled /t REG_DWORD /d 1 /F
    echo Đã bật Snipping Tool bằng phím Print Screen.
) else if %snipChoice%==2 (
    reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SnippingTool /v SnippingToolEnabled /t REG_DWORD /d 0 /F
    echo Đã tắt Snipping Tool bằng phím Print Screen.
) else if %snipChoice%==0 (
    goto Menu
) 
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon13
)
goto Menu

:Luachon14
echo Chọn:
echo 1 - Bật SmartScreen
echo 2 - Tắt SmartScreen
echo 0 - Quay lại menu
set /p ssChoice=Nhập lựa chọn:
if %ssChoice%==1 (
    reg add "HKLM\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /v SmartScreenEnabled /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
    echo Đã bật SmartScreen.
) else if %ssChoice%==2 (
    reg add "HKLM\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /v SmartScreenEnabled /t REG_DWORD /d 0 /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
    echo Đã tắt SmartScreen.
) else if %ssChoice%==0 (
    goto Menu
)
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon14
)
goto Menu


:Luachon15
echo Đang nâng cấp Windows 11 Home lên Pro...
powershell -Command "Start-Process cmd -ArgumentList '/c sc config LicenseManager start= auto ^& net start LicenseManager ^& sc config wuauserv start= auto ^& net start wuauserv ^& changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T' -Verb RunAs"
goto Menu

:Luachon16
echo Mở hộp thoại Folder Options...
start control folders
goto Menu

:Luachon17
echo Chọn:
echo 1 - Tắt BitLocker trên ổ C:
echo 2 - Tắt BitLocker trên ổ D:
echo 3 - Tắt BitLocker trên ổ E:
echo 0 - Quay lại menu
set /p bitlockerChoice=Nhập lựa chọn:
if %bitlockerChoice%==1 (
    echo Đang tắt BitLocker trên ổ C...
    powershell -Command "Start-Process cmd -ArgumentList '/c manage-bde -off C:' -Verb RunAs"
) else if %bitlockerChoice%==2 (
    echo Đang tắt BitLocker trên ổ D...
    powershell -Command "Start-Process cmd -ArgumentList '/c manage-bde -off D:' -Verb RunAs"
) else if %bitlockerChoice%==3 (
    echo Đang tắt BitLocker trên ổ E...
    powershell -Command "Start-Process cmd -ArgumentList '/c manage-bde -off E:' -Verb RunAs"
) else if %bitlockerChoice%==0 (
    goto Menu
) 
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon17
)
echo Đã gửi lệnh tắt BitLocker. Vui lòng chờ quá trình hoàn thành, có thể mất một thời gian tùy thuộc vào dung lượng ổ đĩa và tốc độ máy tính của bạn.
pause
goto Menu

:Luachon18
echo Chọn:
echo 1 - Tắt Office 365 Simplified Account Creation
echo 2 - Bật Office 365 Simplified Account Creation
echo 0 - Quay lại menu
set /p o365Choice=Nhập lựa chọn:
if %o365Choice%==1 (
    REG ADD "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Setup" /v "DisableOffice365SimplifiedAccountCreation" /t REG_DWORD /d "1" /f
    echo Đã tắt Office 365 Simplified Account Creation.
) else if %o365Choice%==2 (
    REG ADD "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Setup" /v "DisableOffice365SimplifiedAccountCreation" /t REG_DWORD /d "0" /f
    echo Đã bật Office 365 Simplified Account Creation.
) else if %o365Choice%==0 (
    goto Menu
)
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon18
)

:Luachon19
echo Đang lấy số seri máy tính...
powershell -Command "Get-WmiObject -Class Win32_BIOS | Select-Object -ExpandProperty SerialNumber"
pause
goto Menu

:Luachon20
echo Đang lấy địa chỉ IP máy tính...
powershell -Command "Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -ne '127.0.0.1' }"
pause
goto Menu

:Luachon21
echo Đang chạy Disk Cleanup...
powershell -Command "Start-Process cmd -ArgumentList '/c cleanmgr /sagerun:1' -Verb RunAs"
goto Menu


:Luachon22
echo Chọn:
echo 1 - Bật Windows Firewall
echo 2 - Tắt Windows Firewall
echo 0 - Quay lại menu
set /p fwChoice=Nhập lựa chọn:
if %fwChoice%==1 (
    powershell -Command "Start-Process cmd -ArgumentList '/c netsh advfirewall set currentprofile state on' -Verb RunAs"
    echo Đã bật Windows Firewall.
) else if %fwChoice%==2 (
    powershell -Command "Start-Process cmd -ArgumentList '/c netsh advfirewall set currentprofile state off' -Verb RunAs"
    echo Đã tắt Windows Firewall.
) else if %fwChoice%==0 (
    goto Menu
)
else (
    echo Lựa chọn không hợp lệ.
    goto Luachon22
)

:End
exit