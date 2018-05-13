# Haxe GameAnalytics

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-gameanalytics/blob/master/LICENSE)

Unofficial asynchronous HTTP/HTTPS GameAnalytics REST API support for Haxe OpenFL targets. Run the demo [here](https://github.com/Tw1ddle/samcodes-gameanalytics-demo).

## Features

* Work with the GameAnalytics Collector REST API from Haxe.
* Post events asynchronously on supported platforms.

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

See the [demo app](https://github.com/Tw1ddle/samcodes-gameanalytics-demo) for a complete example.

The demo app:

![Screenshot of demo app](https://github.com/Tw1ddle/samcodes-analytics-demo/blob/master/screenshots/analytics-demo.png?raw=true "Analytics Demo")

## Notes
This haxelib uses the [akifox-asynchttp](https://github.com/byrobingames/localnotifications) extension for asynchronous HTTP/HTTPS support on supported targets.