﻿# Azure development [⬅️ top](./README.md)

## Prerequisites
[Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools) : Local development experience for creating, developing, testing, running, and debugging Azure Functions.
- ```
  winget install Microsoft.Azure.FunctionsCoreTools
  ```

## Articles/Topics
[Manually run a non HTTP-triggered function](https://learn.microsoft.com/en-us/azure/azure-functions/functions-manually-run-non-http?tabs=azure-portal)

## Issues
1. In Azure Portal, If you get an error about your token being from the wrong issuer, then you probably are accidentally in the wrong subscription.  Switch it by clicking your profile bubble and choose **Switch Directory**.

## Azure - Local Development with ServiceBus

- ## [Azure Issues - Local development story? #2223](https://github.com/Azure/azure-service-bus/issues/223)
  - EventHub emulator exists
  - ServiceBus emulator is under development, release targeted for end of 2024
  
- ## [Squadron testing framework for containerized and cloud services (github)](https://github.com/SwissLife-OSS/squadron)
  - [Home Page](https://swisslife-oss.github.io/squadron/)
  - Squadron is a helpful framework which enables you to write tests against dependent services without any overhead. Squadron can provide you isolation in tests through Container Providers or support for all other services through Cloud Providers.
  - [Azure ServiceBus](https://swisslife-oss.github.io/squadron/docs/azure-cloud-servicebus):
      An Azure ServiceBus resource can be used to write integration tests against *topics* and *queues*.  
      You can either use an existing ServiceBus namespace in Azure or let Squadron provision a new one for every test.

- ## [Lazvard Message - AMQP server simulator (github)](https://github.com/PejmanNik/lazvard-message)
  - Unofficially compatible with Azure Service Bus
  - [Article (dev.to)](https://dev.to/pejmannik/azure-service-bus-simulator-5fe3)

- ## [DevOpsifyMe - Azure Service Bus Emulator](https://github.com/piotr-rojek/devopsifyme-sbemulator)
  - [Article (devopsifyme.com)](https://devopsifyme.com/simple-azure-service-bus-emulator-finally-here/)