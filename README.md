# Haxe GameAnalytics

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-gameanalytics/blob/master/LICENSE)

Unofficial asynchronous GameAnalytics REST API support for Haxe OpenFL targets. See the demo [here](https://github.com/Tw1ddle/samcodes-gameanalytics-demo).

## Features

* Work with the GameAnalytics REST API using Haxe.
* Post events asynchronously on most supported targets.

If there is something you would like adding let me know. Pull requests welcomed too.

## Install

Get the [haxelib](http://lib.haxe.org/p/samcodes-gameanalytics):

```bash
haxelib install samcodes-gameanalytics
```

## Usage

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-gameanalytics" />
```

## Example

See the [demo app](https://github.com/Tw1ddle/samcodes-gameanalytics-demo) for a complete example:

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-gameanalytics-demo/blob/master/screenshots/analytics-demo.png?raw=true "Analytics Demo")

## Notes
This haxelib uses the [akifox-asynchttp](https://github.com/yupswing/akifox-asynchttp) extension for asynchronous HTTP/HTTPS support on supported targets.