#!/bin/bash

# publish projects
dotnet publish -c Release -o /tmp/publish/api --self-contained false --no-restore

# compress publishes
zip -r /tmp/publish/api.zip /tmp/publish/api
