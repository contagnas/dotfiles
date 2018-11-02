#!/usr/bin/env amm
import ammonite.ops._, ImplicitWd._

sealed trait Mode {
  val name: String
}

case object GodMode extends Mode {
  override val name = "god-mode"
}

case object I3mode extends Mode {
  override val name = "i3-mode"
}

case object Default extends Mode {
  override val name = "default"
}

case class KeyBinding(
  bind: String,
  command: String,
  modes: Set[Mode] = Set(GodMode, I3mode, Default),
  breaksI3mode: Boolean = true
)

def switchMode(mode: Mode): String = s"mode ${mode.name}"

def afterCommand(mode: Mode, kb: KeyBinding) =
  (mode, kb.breaksI3mode) match {
    case (I3mode, true) => s"; ${switchMode(Default)}"
    case _ => ""
  }

def indent(mode: Mode, kb: KeyBinding) =
  mode match {
    case Default => ""
    case _ => "  "
  }

def modeEnclosure(mode: Mode): (String, String) =
  mode match {
    case Default => ("", "")
    case _ => (s"\nmode ${mode.name} {", "}\n")
  }

def modifier(mode: Mode): String =
  mode match {
    case Default => "$win+"
    case _ => ""
  }

def makeConfigLine(mode: Mode, kb: KeyBinding): Option[String] = {
  if (!kb.modes(mode)) None
  else Some {
    List(
      indent(mode, kb),
      "bindsym ",
      modifier(mode),
      kb.bind + " ",
      kb.command,
      afterCommand(mode, kb)
    ).mkString
  }
}

val shiftedNumbers = Map(
  0 -> "parenright",
  1 -> "exclam",
  2 -> "at",
  3 -> "numbersign",
  4 -> "dollar",
  5 -> "percent",
  6 -> "asciicircum",
  7 -> "ampersand",
  8 -> "asterisk",
  9 -> "parenleft"
)

val workspaces = (0 to 9).map(i =>
  List(
    KeyBinding(i.toString, s"workspace $$ws$i"),
    KeyBinding(s"Shift+${shiftedNumbers(i)}", s"move container to workspace $$ws$i")
  )).flatten

val keyBindings = List(
  KeyBinding("i", switchMode(Default), modes=Set(GodMode, I3mode)),
  KeyBinding("Escape", switchMode(Default), modes=Set(GodMode, I3mode)),
  KeyBinding("$alt+Escape", switchMode(GodMode), breaksI3mode=false),
  KeyBinding("grave", switchMode(GodMode), modes=Set(I3mode, Default), breaksI3mode=false),
  KeyBinding("grave", switchMode(Default), modes=Set(GodMode), breaksI3mode=false),

  KeyBinding("h", "focus left"),
  KeyBinding("j", "focus down"),
  KeyBinding("k", "focus up"),
  KeyBinding("l", "focus right"),
  KeyBinding("Shift+H", "move left"),
  KeyBinding("Shift+J", "move down"),
  KeyBinding("Shift+K", "move up"),
  KeyBinding("Shift+L", "move right"),
  KeyBinding("$alt+h", "resize shrink width 10 px or 10 ppt", breaksI3mode=false),
  KeyBinding("$alt+j", "resize grow height 10 px or 10 ppt", breaksI3mode=false),
  KeyBinding("$alt+k", "resize shrink height 10 px or 10 ppt", breaksI3mode=false),
  KeyBinding("$alt+l", "resize grow width 10 px or 10 ppt", breaksI3mode=false),

  KeyBinding("v", "split v"),
  KeyBinding("b", "split h"),
  KeyBinding("f", "fullscreen"),

  KeyBinding("r", "exec rofi -show run"),
  KeyBinding("w", "exec rofi -show window"),

  KeyBinding("q", "kill"),
  KeyBinding("Shift+space", "floating toggle"),
  KeyBinding("space", "focus mode_toggle"),

  //@bind(Shift+g) @noBreak mode "$mode_gaps"

  KeyBinding("g", "exec chromium"),
  KeyBinding("e", "exec emacsclient -c"),
  KeyBinding("t", "exec xterm"),

  KeyBinding("Shift+C", "reload"),
  KeyBinding("Shift+R", "restart"),
  KeyBinding("Shift+Q", "Quit")
) ++ workspaces

@main
def main(path: Path = pwd) = {
  val bindings = List(Default, I3mode, GodMode)
    .flatMap { mode =>
      val (before, after) = modeEnclosure(mode)
      val modeBindings = keyBindings.flatMap(kb => makeConfigLine(mode, kb))
      before :: (modeBindings :+ after)
    }

  val configLines = read.lines! path / "config.template"

  configLines.flatMap {
    case "%TEMPLATE_BINDINGS%" => bindings
    case line => List(line)
  }.foreach(println)
}
