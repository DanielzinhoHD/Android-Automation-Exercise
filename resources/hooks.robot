*** Settings ***
Documentation       Aqui se encontram os setups e suites do projeto

Library             AppiumLibrary

*** Keywords ***

Abrir app
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=uiautomator2
    ...                     deviceName=emulator-5554
    ...                     platformName=Android
    ...                     autoGrantPermissions=true
    ...                     appPackage=com.google.android.youtube
    ...                     appActivity=com.google.android.youtube.HomeActivity

Fechar app
    Close Application