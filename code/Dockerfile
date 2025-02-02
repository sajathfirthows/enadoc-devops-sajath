# Use the official .NET SDK image from Microsoft (using .NET 6 SDK)
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Set the working directory inside the container
WORKDIR /src

# Copy the .csproj file and restore any dependencies (via dotnet restore)
COPY ["EnadocApp/EnadocApp.csproj", "EnadocApp/"]
RUN dotnet restore "EnadocApp/EnadocApp.csproj"

# Copy the rest of the application code
COPY . .

# Publish the app to the /app/publish directory
RUN dotnet publish "EnadocApp/EnadocApp.csproj" -c Release -o /app/publish

# Set the base image (using .NET 6 runtime for final stage)
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base

WORKDIR /app
EXPOSE 80

# Copy the published app from the build stage
COPY --from=build /app/publish .

# Define the entry point to run the application
ENTRYPOINT ["dotnet", "EnadocApp.dll"]
