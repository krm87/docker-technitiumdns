FROM mcr.microsoft.com/dotnet/core/runtime:latest

RUN apt-get -y update && apt-get -y install curl libunwind8 icu-devtools apt-transport-https
RUN curl -O https://download.technitium.com/dns/DnsServerPortable.tar.gz && \
    mkdir /app && \
    tar -zxf DnsServerPortable.tar.gz -C /app

EXPOSE 53/udp
EXPOSE 5380

ENTRYPOINT ["dotnet", "/app/DnsServerApp.dll"]