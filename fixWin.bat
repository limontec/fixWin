@ECHO OFF 
:: Este arquivo batch tenta corrigir seu Windows após travar
TITLE Verificando Windows
COLOR 0A
ECHO Por favor espere... Verificando seu sistema.
:: =====================
:: Section 1: Verificando arquivos do sistema para reparar arquivos de sistema ausentes ou corrompidos
ECHO [1/6] Verificando integridade da imagem do sistema (DISM)...
DISM /Online /Cleanup-image /Restorehealth
ECHO [2/6] Verificando e reparando arquivos do sistema (sfc)...
sfc /scannow
:: =====================
:: Section 2: Libera espaço ao limpar componentes atualizados. Tempo limite de 1h
ECHO [3/6] Limpando componentes de atualizações antigas...
DISM /online /Cleanup-Image /StartComponentCleanup
:: =====================
:: Section 3: Cria ponto de restauração automático
ECHO [4/6] Limpando pontos de restauração...
vssadmin delete shadows /all /quiet
ECHO [5/6] Criando pontos de restauração...
powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Automatico' -RestorePointType 'MODIFY_SETTINGS'"
:: Comando alternativo:
:: wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Restore Point", 100, 12
:: =====================
:: Section 4: Limpar cache DNS
ECHO [6/6] Limpando cache DNS...
ipconfig /flushdns
:: =====================
:: Section 5: Atualiza programas automáticamente
ECHO [7/6] Atualizando programas via winget...
winget upgrade --all --include-unknown --accept-source-agreements --accept-package-agreements --silent --verbose --disable-interactivity 
:: =====================
:: Finalização
ECHO ==================================================================================
ECHO Processo finalizado, as mensagens acima informa o sucesso ou nao no procedimento.
ECHO ==================================================================================
start "" https://www.limontec.com/
PAUSE
