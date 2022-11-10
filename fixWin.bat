@ECHO OFF 
:: Este arquivo batch tenta corrigir seu Windows após travar
TITLE Verificando Windows
ECHO Por favor espere... Verificando seu sistema.
:: Section 1: Verificando arquivos do sistema para reparar arquivos de sistema ausentes ou corrompidos
sfc /scannow
DISM /Online /Cleanup-image /Restorehealth
:: Section 2: Libera espaço ao limpar componentes atualizados. Tempo limite de 1h
DISM /online /Cleanup-Image /StartComponentCleanup
:: Section 3: Cria ponto de restauração automático
ECHO Tentando criar ponto de restauração automatico para voce.
wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Restore Point", 100, 7
ECHO ==================================================================================
ECHO Processo finalizado, as mensagens acima informa o sucesso ou nao no procedimento.
ECHO ==================================================================================
start "" https://www.limontec.com/
PAUSE
