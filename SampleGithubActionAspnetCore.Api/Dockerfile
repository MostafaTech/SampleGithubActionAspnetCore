FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["SampleGithubActionAspnetCore.Api/SampleGithubActionAspnetCore.Api.csproj", "SampleGithubActionAspnetCore.Api/"]
RUN dotnet restore "SampleGithubActionAspnetCore.Api/SampleGithubActionAspnetCore.Api.csproj"
COPY . .
WORKDIR "/src/SampleGithubActionAspnetCore.Api"
RUN dotnet build "SampleGithubActionAspnetCore.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "SampleGithubActionAspnetCore.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SampleGithubActionAspnetCore.Api.dll"]