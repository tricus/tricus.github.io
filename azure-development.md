###### <top>
[⬅️ toc](./README.md)
# Azure development

## Prerequisites
[Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools) : Local development experience for creating, developing, testing, running, and debugging Azure Functions.
- ```cmd
  # Main installation (gui installer, takes minutes to install)
  winget install Microsoft.Azure.FunctionsCoreTools

  # VSCode extension (???) (no gui, installed in 49 seconds)
  npm install -g azure-functions-core-tools@4
  ```
[⬆️top](#top)

## PowerShell `Az` module

### Set default subscription for `Connect-AzAccount`
- ```pwsh
  Update-AzConfig -DefaultSubscriptionForLogin 00000000-0000-0000-0000-000000000000
  ```

## *Unauthorized access. 'Listen' claim(s) are required to perform this operation.*
Or, "*'Send' claim(s) are required to perform this operation.*"

Must add **Azure Service Bus Data Owner** role to user.  **Owner** is not sufficient.

This error can also be triggered by an empty/missing password.
> https://stackoverflow.com/q/61724021

[⬆️top](#top)

## Articles/Topics
[Manually run a non HTTP-triggered function](https://learn.microsoft.com/en-us/azure/azure-functions/functions-manually-run-non-http?tabs=azure-portal)  
[⬆️top](#top)

## Issues
1. In Azure Portal, If you get an error about your token being from the wrong issuer, then you probably are accidentally in the wrong subscription.  Switch it by clicking your profile bubble and choose **Switch Directory**.

[⬆️top](#top)

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
  
  [⬆️top](#top)