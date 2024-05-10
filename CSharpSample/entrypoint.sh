#!/bin/sh
# .otel-dotnet-auto/instrument.sh
export OTEL_TRACES_EXPORTER=none \
  OTEL_METRICS_EXPORTER=none \
  OTEL_LOGS_EXPORTER=none \
  OTEL_DOTNET_AUTO_TRACES_CONSOLE_EXPORTER_ENABLED=true \
  OTEL_DOTNET_AUTO_METRICS_CONSOLE_EXPORTER_ENABLED=true \
  OTEL_DOTNET_AUTO_LOGS_CONSOLE_EXPORTER_ENABLED=true \
  OTEL_SERVICE_NAME=csharpsample
. $HOME/.otel-dotnet-auto/instrument.sh
dotnet CSharpSample.dll

