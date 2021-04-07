function quit { #Finaliza/Fecha
    exit   
}
Function Pause { #Aguarda ser selecionada uma tecla 
    Write-Host -NoNewLine "-> PRESSIONE  UMA  TECLA  PARA  CONTINUAR . . .`n"
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
}
Function Logo { #Logo 
    Write-Host "
     ______   _____    _____      ____      __     ___  
    |  ____| |  __ \  |  __ \    |___ \    / /    / _ \ 
    | |__    | |__) | | |__) |     __) |  / /_   | | | |
    |  __|   |  _  /  |  ___/     |__ <  | '_ \  | | | |
    | |____  | | \ \  | |         ___) | | (_) | | |_| |
    |______| |_|  \_\ |_|        |____/   \___/   \___/ 
                                                        
                                                        "
}

function createPast { #Cria as pastas/caminhos do sistema ERP360
    clear
    Logo
    Write-Host "| Selecione o disco que você deseja que seja instalado e criado as pastas |
     [1] = DISCO C:\                                                                         
     [2] = DISCO D:\                                                                         
     [3] = VOLTAR PARA O MENU                                                                
"
    $input = Read-Host -Prompt "-> Selecione"
    if ($input -like "1") {
        $ChkDirectoryDisc = "C:\"
        $ChkDirectory1 = "C:\inetpub\wwwroot\ERP360" 
        $ChkDirectory2 = "C:\BackupElevor"
        $ChkDirectory3 = "C:\inetpub\instalacoesElevor"
        $ChkDirectory4 = "C:\inetpub\sqlserver_data"
        $DirectoryExistDisc = Test-Path $ChkDirectoryDisc
        $DirectoryExists = Test-Path $ChkDirectory1 #irá receber um true or false do test-path
        $DirectoryExist2 = Test-Path $ChkDirectory2 #irá receber um true or false do test-path
        $DirectoryExist3 = Test-Path $ChkDirectory3 #irá receber um true or false do test-path
        $DirectoryExist4 = Test-Path $ChkDirectory4 #irá receber um true or false do test-path
        if ($DirectoryExistDisc -eq $False) {
            Write-Error "-> NÃO FOI ENCONTRADO O DISCO INFORMADO (C:\) "
            Pause
            clear
            createPast
        }
        if ($DirectoryExists -eq $False -or $DirectoryExist2 -eq $False -or $DirectoryExist3 -eq $False -or $DirectoryExist4 -eq $False) {
            if ($DirectoryExists -eq $False) {
                md -Path 'C:\inetpub\wwwroot\ERP360'
                Write-Host "-> PASTAS DO SISTEMA ERP360 CRIADA NO DISCO C:\"
                New-WebApplication -Name "ERP360" -Site 'Default Web Site' -PhysicalPath "c:\inetpub\wwwroot\ERP360" -ApplicationPool "PoolElevor360"
                Write-Host "-> PASTA ERP360 TRANSFORMADA PARA APLICAÇÃO !"
            }
            if ($DirectoryExist2 -eq $False) {
                md -Path 'C:\BackupElevor'
                Write-Host "-> PASTAS DE BACKUP DO SISTEMA ERP360 CRIADA NO DISCO C:\"
            }

            if ($DirectoryExist3 -eq $False) {
                md -Path 'C:\inetpub\instalacoesElevor'
                Write-Host "-> PASTA DE ARQUIVOS DE INSTALAÇÕES DO SISTEMA ERP360 CRIADA NO DISCO C:\"
            }
            if ($DirectoryExist4 -eq $False) {
                md -Path 'C:\inetpub\sqlserver_data'
                Write-Host "-> PASTA DA INSTÂNCIA DO SQL DO SISTEMA ERP360 CRIADA NO DISCO C:\"
            }
            Pause
            createPast        
        }
        else {
            Write-Error "-> Verifique se as pastas já não estão criadas! "
            Pause
            clear
            createPast
        }
    }#fim opcao 1 

    if ($input -like "2") {
        $ChkDirectoryDisc = "D:\"
        $ChkDirectory1 = "D:\inetpub\wwwroot\ERP360" 
        $ChkDirectory2 = "D:\BackupElevor"
        $ChkDirectory3 = "D:\inetpub\instalacoesElevor"
        $ChkDirectory4 = "D:\inetpub\sqlserver_data"
        $DirectoryExistDisc = Test-Path $ChkDirectoryDisc
        $DirectoryExists = Test-Path $ChkDirectory1 #irá receber um true or false do test-path
        $DirectoryExist2 = Test-Path $ChkDirectory2 #irá receber um true or false do test-path
        $DirectoryExist3 = Test-Path $ChkDirectory3 #irá receber um true or false do test-path
        $DirectoryExist4 = Test-Path $ChkDirectory4 #irá receber um true or false do test-path
        if ($DirectoryExistDisc -eq $False) {
            Write-Error "-> NÃO FOI ENCONTRADO O DISCO INFORMADO (D:\) "
            Pause
            clear
            createPast
        }
        if ($DirectoryExists -eq $False -or $DirectoryExist2 -eq $False) {
            if ($DirectoryExists -eq $False) {
                md -Path 'D:\inetpub\wwwroot\ERP360'
                Write-Host "-> PASTAS DO SISTEMA ERP360 CRIADAS NO DISCO D:\"
                New-WebApplication -Name "ERP360" -Site 'Default Web Site' -PhysicalPath "d:\inetpub\wwwroot\ERP360" -ApplicationPool "PoolElevor360"
                Write-Host "-> PASTA ERP360 TRANSFORMADA PARA APLICAÇÃO !"
            }
            if ($DirectoryExist2 -eq $False) {
                md -Path 'D:\BackupElevor'
                Write-Host "-> PASTAS DE BACKUP DO SISTEMA ERP360 CRIADA NO DISCO D:\"
            }
            if ($DirectoryExist3 -eq $False) {
                md -Path 'D:\inetpub\instalacoesElevor'
                Write-Host "-> PASTA DE ARQUIVOS DE INSTALAÇÕES DO SISTEMA ERP360 CRIADA NO DISCO D:\"
            }
            if ($DirectoryExist4 -eq $False) {
                md -Path 'D:\inetpub\sqlserver_data'
                Write-Host "-> PASTA DA INSTÂNCIA DO SQL DO SISTEMA ERP360 CRIADA NO DISCO D:\"
            }
            Pause
            createPast
        }
        else {
            Write-Error "-> Verifique se as pastas já não estão criadas! "
            Pause
            clear
            createPast
        }
    }#fim opcao 2 

    if ($input -like "3") {
        clear
        MenuPrincipal
    }
    if ($input -notlike "1" -or $input -notlike "2" -or $input -notlike "3" ) {
        Write-Error "-> VERIFIQUE O VALOR INFORMADO '$input' !"
        Pause 
        clear
        createPast
    }
}# fim function createPast
function downloadComponentes { #Download dos componentes necessários
    $aspNet = "https://download.microsoft.com/download/F/3/1/F31EF055-3C46-4E35-AB7B-3261A303A3B6/AspNetMVC3ToolsUpdateVS11Setup.exe"
    $netFramework = "https://download.microsoft.com/download/6/E/4/6E48E8AB-DC00-419E-9704-06DD46E5F81D/NDP472-KB4054530-x86-x64-AllOS-ENU.exe"
    $sqlServer = "https://download.microsoft.com/download/7/f/8/7f8a9c43-8c8a-4f7c-9f92-83c18d96b681/SQL2019-SSEI-Expr.exe"
    $ssms = "https://download.microsoft.com/download/3/f/d/3fd533f5-fdfc-407d-98a6-d5deb214d13b/SSMS-Setup-PTB.exe"
    $output = ""
    $start_time = Get-Date

    #Download Files
    $ChkDirectory1 = "C:\inetpub\instalacoesElevor"
    $ChkDirectory2 = "D:\inetpub\instalacoesElevor"
    $DirectoryExists1 = Test-Path $ChkDirectory1 #irá receber um true or false do test-path
    $DirectoryExists2 = Test-Path $ChkDirectory2 #irá receber um true or false do test-path
    if ($DirectoryExists1 -eq $True) {
        md -Path 'C:\inetpub\instalacoesElevor' -force    
        $output = "C:\inetpub\instalacoesElevor" 
        Write-Host "-> Pasta encontrada no disco C:\ do Windows ..."
    }
    if ($DirectoryExists2 -eq $True) {
        md -Path 'D:\inetpub\instalacoesElevor' -force
        $output = "D:\inetpub\instalacoesElevor"
        Write-Host "-> Pasta encontrada no disco D:\ do Windows ..."
    }
    #Executa os downloads, e deve ser chamado antes do laço ELSE abaixo
    Import-Module BitsTransfer
    Write-Output "-> Aguarde efetuando o download do ASPNet MVC 3 TOOLS UPDATE ..."
    Start-BitsTransfer -Source $aspNet -Destination $output #-Asynchronous
    Write-Output "-> Aguarde efetuando o download do NetFramework 7.4.2 ...."
    Start-BitsTransfer -Source $netFramework -Destination $output #-Asynchronous
    Write-Output "-> Aguarde efetuando o download do SQL Server 2019 Express ..."
    Start-BitsTransfer -Source $sqlServer -Destination $output #-Asynchronous
    Write-Output "-> Aguarde efetuando o download do SQL Server Management Studio(SSMS) ..."
    Start-BitsTransfer -Source $ssms -Destination $output #-Asynchronous
    #caso seja executado no powershell 
    Import-Module BitsTransfer
    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    Write-Output "___________________ Download's Concluídos ! _____________________"
    Pause
    Clear
    MenuPrincipal

    else {
        Write-Error "-> Não foi encontrada a pasta 'instalacoesElevor' em nenhum diretório(C:\ ou D:\) Verifique
        para executar a criação das pastas !"
        Pause
        clear 
        MenuPrincipal
    }
    
}

Function powerPlan { #Cria o plano de energia
    # Clear the screen
    clear
    Logo
    Write-Host "                    | O P C O E S |  
    Copie e cole o GUID_SCHEME abaixo que deseje aplicar        
    [1] = Criar Scheme Máximo desempenho                        
    [2] = Mostrar Scheme aplicado                               
    [3] = Voltar                                                

"     
    powercfg -l
    $input = Read-Host -Prompt "-> Selecione"
    if ("$input" -ne "1" -and $input -ne "2" -and $input -ne "3") { 
        $x = $input
        powercfg /s $x
        Write-Output "-> Plano de energia aplicado!"
        Pause  
        clear
        powerPlan 
    }
    if ("$input" -like "1") { 
        POWERCFG -DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61
        POWERCFG -CHANGENAME e9a42b02-d5df-448d-aa00-03f14749eb61 "ELEVOR360"
        Pause
        Clean
        powerPlan
    }
    if ("$input" -like "2") { 
        $currentScheme = Powercfg -getactivescheme
        $currentScheme = $currentScheme.split("()")
        Write-Host "Current Power Scheme:" $currentScheme[1]
        Write-Host "`n"
        Pause
        powerPlan
    }
    if ("$input" -like "3") { 
        Clear
        MenuPrincipal
    }
    else {
        Write-Error "-> Verifique o valor informado !"
        Pause 
        Clear
        powerPlan
    }
}

function MenuPrincipal { #Menu com as opções
    Clear
    Logo
    Write-Host "                                   
                        |  O P C O E S  | 

  [1] = Baixar e Instalar IIS (Internet Information Services)                                                   
  [2] = Criar as pastas do sistema, POOL e adicionar para aplicação                                             
  [3] = Realizar o Download dos componentes necessários (SQL Server 2019, SSMS, NetFramework 7.4.2, ASPNet) *2   
  [4] = Menu Scheme Power Plan (Plano de Energia)                                                               
  [5] = Fechar
  
  "
    
    $input = Read-Host -Prompt "-> Selecione "
    if ("$input" -like "1") { downloadIIS }
    if ("$input" -like "2") { createPast }
    if ("$input" -like "3") { downloadComponentes }
    if ("$input" -like "4") { powerPlan }
    if ("$input" -like "5") { quit }
    else {
        Write-Error "-> Verifique o valor informado !"
        Pause  
    }
    MenuPrincipal
}
function downloadIIS {
    clear
    Logo
    #Set-ExecutionPolicy Bypass -Scope Process
    # Install IIS 
    Write-Output "-> Aguarde baixando componente IIS-WebServerRole"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole 
    Write-Output "-> Aguarde baixando componente IIS-WebServer"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer 
    Write-Output "-> Aguarde baixando componente IIS-CommonHttpFeatures"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
    Write-Output "-> Aguarde baixando componente IIS-HttpErrors" 
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors 
    Write-Output "-> Aguarde baixando componente IIS-ApplicationDevelopment"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment 
    Write-Output "-> Aguarde baixando componente IIS-NetFx4Extended-ASPNET45"
    Enable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45
    Write-Output "-> Aguarde baixando componente IIS-NetFxExtensibility45"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45 
    Write-Output "-> Aguarde baixando componente IIS-HealthAndDiagnostics"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics 
    Write-Output "-> Aguarde baixando componente IIS-HttpLogging"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging 
    Write-Output "-> Aguarde baixando componente IIS-RequestMonitor"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor 
    Write-Output "-> Aguarde baixando componente IIS-Security"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security 
    Write-Output "-> Aguarde baixando componente IIS-URLAuthorization"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-URLAuthorization 
    Write-Output "-> Aguarde baixando componente IIS-RequestFiltering"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
    Write-Output "-> Aguarde baixando componente IIS-IPSecurity" 
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-IPSecurity 
    Write-Output "-> Aguarde baixando componente IIS-Performance"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance 
    Write-Output "-> Aguarde baixando componente IIS-WebServerManagementTools"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools 
    Write-Output "-> Aguarde baixando componente IIS-IIS6ManagementCompatibility"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
    Write-Output "-> Aguarde baixando componente IIS-ManagementScriptingTools" 
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools 
    Write-Output "-> Aguarde baixando componente IIS-Metabase"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase 
    Write-Output "-> Aguarde baixando componente IIS-ManagementConsole"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole  
    Write-Output "-> Aguarde baixando componente IIS-StaticContent"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent 
    Write-Output "-> Aguarde baixando componente IIS-DefaultDocument"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument 
    Write-Output "-> Aguarde baixando componente IIS-ApplicationInit"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit 
    Write-Output "-> Aguarde baixando componente IIS-ISAPIExtensions"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions 
    Write-Output "-> Aguarde baixando componente IIS-ISAPIFilter"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
    Write-Output "-> Aguarde baixando componente IIS-HttpCompressionStatic" 
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic 
    Write-Output "-> Aguarde baixando componente IIS-ASPNET45"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 
    Write-Output "-> Aguarde baixando componente IIS-DirectoryBrowsing"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing 
    Write-Output "-> Aguarde baixando componente IIS-ManagementService"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService 
    Write-Output "-> Aguarde baixando componente IIS-WMICompatibility"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WMICompatibility 
    Write-Output "-> Aguarde baixando componente IIS-LegacyScripts"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacyScripts
    Write-Output "-> Aguarde baixando componente IIS-WindowsAuthentication"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication  
    # Create POOL
    New-WebAppPool -name "PoolElevor360" -Force
    Set-ItemProperty IIS:\AppPools\PoolElevor360 -name processModel.identityType -value ApplicationPoolIdentity
    Set-ItemProperty IIS:\AppPools\PoolElevor360 -name enable32BitAppOnWin64 -Value true 
    Write-Host " -> C O N C L U Í D O !"
    Pause
    MenuPrincipal
}

MenuPrincipal







