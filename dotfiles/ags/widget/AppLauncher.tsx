
import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createState, For } from "gnim"
import Apps from "gi://AstalApps"

export default function Launcher() {
  const apps = new Apps.Apps()
  const [list, setList] = createState(new Array<Apps.Application>())

  let win: Astal.Window
  let entry: Gtk.Entry

  const search = (text: string) => setList(apps.fuzzy_query(text).slice(0, 8))
  const hide = () => win.hide()
  const launch = (item?: Apps.Application) => {
    if (!item) return
    hide()
    item.launch()
  }

  return (
    <window
      $={(self) => (win = self)}
      name="launcher"
      cssClasses={["launcher"]}
      application={app}
      visible={false}
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.EXCLUSIVE}
      onNotifyVisible={(self) => {
        if (!self.visible) return
        entry.set_text("")
        search("")
        entry.grab_focus()
      }}
    >
      <Gtk.EventControllerKey
        onKeyPressed={(_, keyval) => {
          if (keyval === Gdk.KEY_Escape) {
            hide()
            return true
          }
          return false
        }}
      />
      <box orientation={Gtk.Orientation.VERTICAL} cssClasses={["panel"]}>
        <entry
          $={(self) => (entry = self)}
          placeholderText="Search apps..."
          onNotifyText={({ text }) => search(text)}
          onActivate={() => launch(list.peek()[0])}
        />
        <box orientation={Gtk.Orientation.VERTICAL}>
          <For each={list}>
            {(item) => (
              <button onClicked={() => launch(item)}>
                <box spacing={12}>
                  <image iconName={item.iconName} pixelSize={32} />
                  <label label={item.name} xalign={0} />
                </box>
              </button>
            )}
          </For>
        </box>
      </box>
    </window>
  )
}