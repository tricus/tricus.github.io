###### <top>
[⬅️ toc](./README.md)
# C#

## Libraries
ISLE - Interpolated String Logging Extensions | https://github.com/fedarovich/isle  
[⬆️top](#top)

## Await inside a non-async method
    ((Action)(async () => { await Task.CompletedTask; }))();
- https://stackoverflow.com/questions/10198370/execute-lambda-expression-immediately-after-its-definition#comment109010444_10198535

[⬆️top](#top)

## class vs. record

### Primary Constructor

The parameters to a `record` primary constructor become init-only public properties
```cs
public record MyRecord(string InitOnlyPublicProperty);

public class MyClass(string PrivateFieldOnlyIfReferencedInsideClass);
```
[⬆️top](#top)