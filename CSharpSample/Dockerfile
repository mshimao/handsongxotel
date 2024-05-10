FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG configuration=Release
WORKDIR /src
COPY ["CSharpSample.csproj", "./"]
RUN dotnet restore "CSharpSample.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "CSharpSample.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "CSharpSample.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final

WORKDIR /app
COPY --from=publish /app/publish .

ADD otel-dotnet-auto /app/.otel-dotnet-auto
USER root
RUN chmod +x /app/.otel-dotnet-auto

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER $APP_UID 

ENTRYPOINT ["/entrypoint.sh"]
