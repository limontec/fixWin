@ECHO OFF 
:: Este arquivo batch tenta corrigir seu Windows após travar
TITLE Verificando Windows
ECHO Por favor espere... Verificando seu sistema.
:: Section 1: Verificando arquivos do sistema para reparar arquivos de sistema ausentes ou corrompidos
sfc /scannow
DISM /Online /Cleanup-image /Restorehealth
ECHO ==================================================================================
ECHO Processo finalizado, as mensagens acima informa o sucesso ou nao no procedimento.
ECHO ==================================================================================
start "" https://www.limontec.com/
PAUSE
