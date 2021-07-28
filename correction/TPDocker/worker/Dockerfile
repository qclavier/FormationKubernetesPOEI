#image pour le build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build

WORKDIR /app

COPY src/Worker/Worker.csproj .

RUN dotnet restore

COPY src/Worker/ .

RUN dotnet publish -c Release -o /out Worker.csproj

#image pour l'execution
FROM mcr.microsoft.com/dotnet/core/runtime:3.1 

WORKDIR /app

COPY --from=build /out .

CMD ["dotnet", "Worker.dll"]
