const electron = require('electron');
const app = electron.app;

let wnd;
 
function initWindow() {
  wnd = new electron.BrowserWindow({width: 800, height: 600});
 
  wnd.loadFile('index.html');
 
  wnd.webContents.openDevTools();
 
  wnd.on('closed', () => {
    wnd = null;
  });
}
 
app.on('ready', initWindow);
 
app.on('window-all-closed', () => {
  // Quit application if platform is not macOS.
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (wnd === null) {
    initWindow();
  }
});

