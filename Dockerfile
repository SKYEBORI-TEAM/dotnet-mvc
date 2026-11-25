dockerfile
FROM ://microsoft.com AS build
WORKDIR /src
COPY . .
RUN dotnet publish "mywebapp/mywebapp.csproj" -c Release -o /app/publish

FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "mywebapp.dll"]