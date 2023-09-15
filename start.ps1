Write-Output Starting...

$acc_file = 'acc.txt'

if (Test-Path -Path $acc_file -PathType Leaf) {
    Write-Output 'Found acc.txt, loading account...'
    Get-Content -Path $acc_file -OutVariable data | Out-Null
    $split = $data -split '          '
    $name = $split[0]
    $pass = $split[1]
} else {
    $name = Read-Host -Prompt 'Enter microsoft username: '
    $pass = Read-Host -Prompt 'Enter microsoft password: '

    $shouldSave = Read-Host -Prompt 'Save credentials? (y/n): '

    if ($shouldSave -eq 'y') {
        Write-Output "Saving..."
        "$name          $pass" | Out-File -FilePath $acc_file
    }
}

# escape quotes in password
$pass = $pass.replace('"', '"""')

$params = "-Dos.name=`"Windows 10`" -Dos.version=10.0 -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Djava.library.path=.\natives -Dminecraft.launcher.brand=minecraft-launcher -Dminecraft.launcher.version=2.4.39 -Dminecraft.client.jar=.\1.8.9.jar -cp libraries\com\mojang\netty\1.8.8\netty-1.8.8.jar;libraries\oshi-project\oshi-core\1.1\oshi-core-1.1.jar;libraries\net\java\dev\jna\jna\3.4.0\jna-3.4.0.jar;libraries\net\java\dev\jna\platform\3.4.0\platform-3.4.0.jar;libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;libraries\net\sf\jopt-simple\jopt-simple\4.6\jopt-simple-4.6.jar;libraries\com\paulscode\codecjorbis\20101023\codecjorbis-20101023.jar;libraries\com\paulscode\codecwav\20101023\codecwav-20101023.jar;libraries\com\paulscode\libraryjavasound\20101123\libraryjavasound-20101123.jar;libraries\com\paulscode\librarylwjglopenal\20100824\librarylwjglopenal-20100824.jar;libraries\com\paulscode\soundsystem\20120107\soundsystem-20120107.jar;libraries\io\netty\netty-all\4.0.23.Final\netty-all-4.0.23.Final.jar;libraries\com\google\guava\guava\17.0\guava-17.0.jar;libraries\org\apache\commons\commons-lang3\3.3.2\commons-lang3-3.3.2.jar;libraries\commons-io\commons-io\2.4\commons-io-2.4.jar;libraries\commons-codec\commons-codec\1.9\commons-codec-1.9.jar;libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;libraries\com\google\code\gson\gson\2.2.4\gson-2.2.4.jar;libraries\com\mojang\authlib\1.5.21\authlib-1.5.21.jar;libraries\com\mojang\realms\1.7.59\realms-1.7.59.jar;libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;libraries\org\apache\logging\log4j\log4j-api\2.0-beta9\log4j-api-2.0-beta9.jar;libraries\org\apache\logging\log4j\log4j-core\2.0-beta9\log4j-core-2.0-beta9.jar;libraries\org\lwjgl\lwjgl\lwjgl\2.9.4-nightly-20150209\lwjgl-2.9.4-nightly-20150209.jar;libraries\org\lwjgl\lwjgl\lwjgl_util\2.9.4-nightly-20150209\lwjgl_util-2.9.4-nightly-20150209.jar;libraries\tv\twitch\twitch\6.5\twitch-6.5.jar;1.8.9.jar -Xmx2G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Dlog4j.configurationFile=assets\log_configs\client-1.7.xml net.minecraft.client.main.Main --username `"$name`" --password `"$pass`" --version 1.8.9 --gameDir data/ --assetsDir assets --assetIndex 1.8 --userProperties {} --userType msa"

$params = $params.Split(' ')

& '.\a.exe' $params

#& '.\zulu\bin\java.exe' $params
pause
