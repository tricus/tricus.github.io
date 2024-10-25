###### <top>
[⬅️ toc](./README.md)
# Azure DevOps

### [Visual Studio Developer Community | Branch Policy: prevent PR requester from resolving](https://developercommunity.visualstudio.com/t/branch-policy-prevent-pr-requester-from-resolving/627291#:~:text=We%20prefer%20that%20someone%20other,any%20feedback%20to%20their%20comment)  
[⬆️top](#top)

### Pipeline parts
```yml
stageA:
- jobA1 # each job runs on one agent, or can be agentless
  variables:
  - name: TheVariableName
    value: TheVariableValue
  steps:
    - script|task:
- jobA2
stageB
- jobB1
- jobB2
```

[⬆️top](#top)
