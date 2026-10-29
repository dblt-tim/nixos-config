import app from "ags/gtk4/app"
import style from "./style.css"
import Launcher from "./widget/AppLauncher"

app.start({
  css: style,
  main() {
    Launcher()
  },
  // `ags request launcher` toggles the window
  requestHandler(argv, response) {
    if (argv[0] === "launcher") {
      const win = app.get_window("launcher")
      if (win) win.visible = !win.visible
      return response("ok")
    }
    response("unknown request")
  },
})