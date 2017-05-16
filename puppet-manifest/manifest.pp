# https://docs.microsoft.com/en-us/aspnet/core/publishing/iis#install-the-net-core-windows-server-hosting-bundle

package { 'Microsoft Visual C++ 2015 Redistributable (x64) - 14.0.24215':
    ensure          => installed,  
    #source          => 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe',
    source          => 'C:\vagrant\downloads\vc_redist.x64.exe',
    install_options => ['/q', '/norestart'],
} ->
package { 'Microsoft .NET Core 1.0.4 & 1.1.1 - Windows Server Hosting':
    ensure          => installed,
    #source          => 'http://download.microsoft.com/download/3/8/1/381CBBF3-36DA-4983-BFF3-5881548A70BE/DotNetCore.1.0.4_1.1.1-WindowsHosting.exe',
    source          => 'C:\vagrant\downloads\DotNetCore.1.0.4_1.1.1-WindowsHosting.exe',
    install_options => ['/q', '/forcerestart'],
}

dotnet { 'dotnet47':
    version => '4.7',
}
