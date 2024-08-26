###### <top>
[⬅️ toc](./README.md)
# LINQPad

## Fix bug in current Xunit release
Change line 56 of the `xunit` `#load`-ed module from:
```cs
runner.Start();
```
to
```cs
runner.Start(parallelAlgorithm: null);
```
[⬆️top](#top)