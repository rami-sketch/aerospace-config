#!/usr/bin/env swift
import Cocoa
import WebKit

let app = NSApplication.shared
app.setActivationPolicy(.accessory)

let screenFrame = NSScreen.main!.frame
let windowWidth: CGFloat = 800
let windowHeight: CGFloat = 400
let windowX = (screenFrame.width - windowWidth) / 2
let windowY = (screenFrame.height - windowHeight) / 2

let window = NSWindow(
    contentRect: NSRect(x: windowX, y: windowY, width: windowWidth, height: windowHeight),
    styleMask: [.borderless],
    backing: .buffered,
    defer: false
)

window.isOpaque = false
window.backgroundColor = NSColor.clear
window.level = .floating
window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]

let webView = WKWebView(frame: window.contentView!.bounds)
webView.autoresizingMask = [.width, .height]
webView.setValue(false, forKey: "drawsBackground")

let htmlPath = NSString(string: "~/.config/aerospace-cheatsheet/cheatsheet.html").expandingTildeInPath
let htmlURL = URL(fileURLWithPath: htmlPath)
webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())

window.contentView?.addSubview(webView)
window.makeKeyAndOrderFront(nil)
app.activate(ignoringOtherApps: true)

app.run()
