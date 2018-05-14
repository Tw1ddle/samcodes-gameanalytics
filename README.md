# Haxe GameAnalytics

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-gameanalytics/blob/master/LICENSE)

Unofficial cross-platform GameAnalytics REST API support for Haxe OpenFL targets. Almost working - but some issues in dependencies have caused me to shelve the project.

See the demo code [here](https://github.com/Tw1ddle/samcodes-gameanalytics-demo), and run it in your browser [here](http://tw1ddle.github.io/samcodes-gameanalytics-demo/index.html).

## Features

* Use the GameAnalytics REST API with Haxe.
* Post events asynchronously on most targets.

If there is something you would like adding let me know. Pull requests welcomed too.

## Known Issues

As of Haxe 3.4.7, OpenFL 8.0.1 there are some blocking issues to fix:

 * Submitting events to the GameAnalytics servers results in HTTP 500 error responses. That needs some work.
 * Connecting to the GameAnalytics servers work fine via HTTP on all targets, but HTTPS doesn't seem to work at all, not sure why.
 * Using gzip compression results in HTTP 401 authorization errors, not sure why. I have tried both hxPako Gzip and lime.util.compress.Gzip compression, same result with gzip deflate methods.
 * Support on iOS reportedly has issues due to Haxe problems: https://github.com/yupswing/akifox-asynchttp/issues/27

Note this hasn't seen much testing or any use in a commercial app yet. Use with caution!

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